*** Settings ***

Resource         ../base.resource

Test Setup       Start Browser
Test Teardown    End Session


*** Test Cases ***
Add an item to cart
    [Tags]    smoke

    Given to login                                       ${USUARIO}    
    ...                                                  ${SENHA}
    When add a product to the cart                       productName=Sauce Labs Onesie
    Then cart icon displays number of products added     expectedText=1