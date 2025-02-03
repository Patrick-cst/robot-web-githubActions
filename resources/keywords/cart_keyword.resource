*** Settings ***
Documentation    Este arquivo é responsável pela criação e organização das keywords reutilizáveis.  
...              Ele centraliza ações comuns, facilitando a manutenção e o reuso em diferentes cenários de teste.

Resource         ../../base.resource



*** Keywords ***
Cart icon displays number of products added
    [Documentation]     Cart icon displays number of products added
    [Arguments]                       ${expectedText}
    
    Wait Until Element Is Visible     ${cart.btnQuantityOfItemInCart}
    ${textObtained}    Get Text       ${cart.btnQuantityOfItemInCart}

    Should Be Equal As Numbers        ${textObtained}    
    ...                               ${expectedText}
    
    #Tirar Screenshot                  Cart icon displays number of products added