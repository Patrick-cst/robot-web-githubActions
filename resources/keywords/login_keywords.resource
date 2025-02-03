*** Settings ***
Documentation    Este arquivo é responsável pela criação e organização das keywords reutilizáveis.  
...              Ele centraliza ações comuns, facilitando a manutenção e o reuso em diferentes cenários de teste.

Resource    ../../base.resource


*** Keywords ***
Given to login
    [Arguments]                          ${username}           
    ...                                  ${password}
    
    Input Text                           ${login.cmpUsername}     
    ...                                  ${username}
    Input Text                           ${login.cmpPassword}     
    ...                                  ${password}
    Tirar Screenshot                     os campos 'username' e 'senha' foram preenchidos
    Click Button                         ${login.btnLogin}


Then check the successful login message
    [Arguments]                          ${mensagem}

    Element Should Be Visible            ${mensagem}
    Tirar Screenshot                     validar login efetuado com sucesso
