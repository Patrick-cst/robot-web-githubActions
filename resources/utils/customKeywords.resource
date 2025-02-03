*** Settings ***

Resource    ../../base.resource

*** Keywords ***
Configurar Navegador
    [Documentation]    Configura e inicializa o navegador.
    
    IF    '${browser}' == 'firefox'
        ${options}=    Evaluate    selenium.webdriver.FirefoxOptions()    selenium.webdriver
    ELSE IF    '${browser}' == 'chrome'
        ${options}=    Evaluate    selenium.webdriver.ChromeOptions()    selenium.webdriver
    ELSE
        Fail    Navegador não suportado: ${browser}
    END

    IF    '${headless}' == 'True'
        Call Method    ${options}    add_argument    --headless
        Call Method    ${options}    add_argument    --disable-gpu
        Call Method    ${options}    add_argument    --no-sandbox
    END

    Open Browser    ${base_url}    ${browser}    options=${options}
    Maximize Browser Window
