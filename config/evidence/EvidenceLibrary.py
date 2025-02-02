from robot.libraries.BuiltIn import BuiltIn
from fpdf import FPDF
import yaml
import os
import time

class EvidenceLibrary:
    def __init__(self):
        self.evidencias = []
        self.imagem_cabecalho = None  # Caminho da imagem do cabeçalho
        self._carregar_caminho_imagem()

    def _carregar_caminho_imagem(self):
        """Carrega o caminho da imagem de cabeçalho do arquivo environment.yaml."""
        try:
            with open("config/environments/environment.yaml", "r") as file:
                config = yaml.safe_load(file)
                self.imagem_cabecalho = config.get("image", {}).get("header_path")
                if not self.imagem_cabecalho or not os.path.exists(self.imagem_cabecalho):
                    print(f"Imagem do cabeçalho não encontrada: {self.imagem_cabecalho}")
                    self.imagem_cabecalho = None
        except Exception as e:
            print(f"Erro ao carregar a imagem do cabeçalho: {e}")
            self.imagem_cabecalho = None

    def _get_selenium_instance(self):
        """Obtém a instância do WebDriver gerenciado pelo SeleniumLibrary."""
        return BuiltIn().get_library_instance('SeleniumLibrary').driver

    def tirar_screenshot(self, texto):
        """Captura uma screenshot do navegador e armazena junto com o texto."""
        if not os.path.exists('results/evidences'):
            os.makedirs('results/evidences')

        timestamp = time.strftime("%Y%m%d_%H%M%S")
        screenshot_path = f"results/evidences/screenshot_{timestamp}.png"
        
        driver = self._get_selenium_instance()
        driver.save_screenshot(screenshot_path)

        self.evidencias.append({"caminho": screenshot_path, "texto": texto})

    def gerar_pdf_evidencias(self, nome_pdf=None):
        """Gera um PDF consolidando todas as evidências capturadas com melhorias de formatação."""
        if not self.evidencias:
            raise Exception("Nenhuma evidência foi capturada para gerar o PDF.")

        status_teste = BuiltIn().get_variable_value("${TEST STATUS}")
        nome_cenario = BuiltIn().get_variable_value("${TEST NAME}")
        data = time.strftime("%d-%m-%Y")
        hora = time.strftime("%Hh-%Mm-%Ss")

        if not nome_pdf:
            nome_pdf = f"{status_teste}_{nome_cenario}_{data}_{hora}.pdf"
        
        data_folder = os.path.join("results/evidences", data)
        if not os.path.exists(data_folder):
            os.makedirs(data_folder)
        
        pdf_output_path = os.path.join(data_folder, nome_pdf)

        pdf = FPDF(orientation="L", unit="mm", format="A4")
        
        # Adiciona imagem de cabeçalho, se existir
        pdf.add_page()
        if self.imagem_cabecalho:
            try:
                pdf.image(self.imagem_cabecalho, x=10, y=10, w=50)
            except Exception as e:
                print(f"Erro ao adicionar imagem do cabeçalho: {e}")
        
        # Adiciona o título do relatório
        pdf.set_font("Arial", style="B", size=16)
        pdf.set_xy(10, 60)
        pdf.cell(0, 10, f"Cenário: {nome_cenario}", ln=True)
        pdf.cell(0, 10, f"Status: {status_teste}", ln=True)

        # Adiciona as evidências (capturas de tela)
        for evidencia in self.evidencias:
            caminho_imagem = evidencia["caminho"]
            texto = evidencia["texto"]
            
            pdf.add_page()  # Nova página para cada evidência
            pdf.set_font("Arial", style="B", size=12)
            pdf.set_text_color(255, 0, 0)
            pdf.cell(0, 10, "Passo executado:", ln=True)

            pdf.set_font("Arial", style="", size=12)
            pdf.set_text_color(0, 0, 0)
            pdf.multi_cell(0, 10, texto)
            pdf.ln(5)  # Ajusta o espaçamento após o texto

            # Adiciona a imagem da evidência
            try:
                pdf.image(caminho_imagem, x=10, y=pdf.get_y(), w=277)  # Ajusta a largura
                pdf.ln(5)  # Espaço após a imagem
            except Exception as e:
                print(f"Erro ao adicionar imagem de evidência: {e}")

        # Salva o arquivo PDF
        pdf.output(pdf_output_path)

        # Remove as evidências temporárias
        for evidencia in self.evidencias:
            try:
                os.remove(evidencia["caminho"])
            except FileNotFoundError:
                print(f"Arquivo não encontrado: {evidencia['caminho']}")
            except Exception as e:
                print(f"Erro ao excluir arquivo {evidencia['caminho']}: {e}")

        # Limpa a lista de evidências
        self.evidencias.clear()
        print(f"PDF gerado com sucesso: {pdf_output_path}")
        return pdf_output_path
