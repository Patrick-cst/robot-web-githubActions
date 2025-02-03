*** Settings ***

Resource    ../base.resource


*** Keywords ***
Iniciar sessão
    [Documentation]    Iniciando sessão

    Configurar Navegador

Finalizar sessão  
    [Documentation]    Finalizando sessão 
    
   # Gerar Pdf Evidencias
    Close Browser 