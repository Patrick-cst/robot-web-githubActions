*** Settings ***

Resource         ../base.resource

Test Setup       Start Browser
Test Teardown    End Session

*** Test Cases ***
Valid Login Test
    [Tags]    smoke

    Given to login                              ${USUARIO}    
    ...                                         ${SENHA}
    Then check the successful login message     ${TITULO_SWAGLABS}
