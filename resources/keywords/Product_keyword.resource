*** Settings ***
Documentation    Este arquivo é responsável pela criação e organização das keywords reutilizáveis.  
...              Ele centraliza ações comuns, facilitando a manutenção e o reuso em diferentes cenários de teste.

Resource         ../../base.resource


*** Keywords ***
Add product to cart
    [Documentation]    Add product to cart
    [Arguments]                       ${productName}

    ${btnAddToCart}    Set Variable   //div[@data-test='inventory-item-name'][text()='${product_name}']//following::button[text()='Add to cart'][1]

    Tirar Screenshot                  Add product to cart
    Wait Until Element Is Visible     xpath=${btnAddToCart}
    Click Element                     xpath=${btnAddToCart}