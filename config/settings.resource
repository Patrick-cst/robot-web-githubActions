*** Settings ***

Resource    ../base.resource


*** Keywords ***
Start Browser
    [Documentation]    Iniciando sessão

    Configurar Navegador

End Session 
    [Documentation]    Finalizando sessão 
    
    Gerar Pdf Evidencias
    Close Browser 