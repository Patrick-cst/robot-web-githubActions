*** Settings ***
Documentation    Este arquivo é responsável pela criação e organização das keywords reutilizáveis.  
...              Ele centraliza ações comuns, facilitando a manutenção e o reuso em diferentes cenários de teste.

Resource    ../../base.resource


*** Keywords ***
log in
    [Arguments]                          ${username}           
    ...                                  ${password}
    
    Input Text                           ${USERNAME_FIELD}     
    ...                                  ${username}
    Input Text                           ${PASSWORD_FIELD}     
    ...                                  ${password}
    #Tirar Screenshot                     os campos 'username' e 'senha' foram preenchidos
    Click Button                         ${LOGIN_BUTTON}


Verificar Login Bem-Sucedido
    [Arguments]                          ${mensagem}

    Element Should Be Visible            ${mensagem}
    #Tirar Screenshot                     validar login efetuado com sucesso
