*** Settings ***

Resource         ../base.resource

Test Setup       Iniciar sessão
Test Teardown    Finalizar sessão


*** Test Cases ***
Scenario - Add an item to cart
    [Tags]    smoke
    
    log in                                          ${USUARIO}    
    ...                                             ${SENHA}
    Sleep    0.6
    Add product to cart                             productName=Sauce Labs Onesie
    Sleep    0.6
    Cart icon displays number of products added     expectedText=1
    Sleep    0.6