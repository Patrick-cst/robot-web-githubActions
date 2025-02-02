*** Settings ***

Resource         ../base.resource

Test Setup       Iniciar sessão
Test Teardown    Finalizar sessão

*** Test Cases ***
Scenario Teste de Login Válido
    log in                          ${USUARIO}    
    ...                             ${SENHA}
    Verificar Login Bem-Sucedido    ${TITULO_SWAGLABS}
