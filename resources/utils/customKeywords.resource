*** Settings ***

Resource    ../../base.resource

*** Keywords ***
Configurar Navegador
    [Documentation]    Configura e inicializa o navegador.
    
    #${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    #Run Keyword If    ${headless} == True    Call Method     ${options}        add_argument    --headless
    #Call Method       ${options}             add_argument    --disable-gpu
    #Call Method       ${options}             add_argument    --no-sandbox
    #Open Browser      ${base_url}            ${browser}      options=${options}
    #Maximize Browser Window   
    ${options}=    Run Keyword If    '${browser}' == 'chrome'  
    ...    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    
    ${options}=    Run Keyword If    '${browser}' == 'firefox'  
    ...    Evaluate    sys.modules['selenium.webdriver'].FirefoxOptions()    sys, selenium.webdriver

    Run Keyword If    ${headless} == True    Call Method     ${options}        add_argument    --headless
    Call Method       ${options}             add_argument    --disable-gpu
    Call Method       ${options}             add_argument    --no-sandbox

    Open Browser      ${base_url}            ${browser}      options=${options}
    Maximize Browser Window
