*** Settings ***
## Bibliotecas
Library      SeleniumLibrary
Library      config/evidence/EvidenceLibrary.py

## Configs
Resource     config/settings.resource
Variables    config/environments/browser.yaml
Variables    config/environments/environment.yaml

## Keywords
Resource     resources/utils/customKeywords.resource
Resource     resources/keywords/login_keywords.resource
Resource     resources/keywords/cart_keyword.resource

## Locators
Variables    resources/locators/cartLocators.yml
Variables    resources/locators/productsLocators.yml
Variables    resources/locators/cartLocators.yml
Variables    resources/locators/loginLocators.yml

## Variables
Resource     resources/variables/common_variables.resource
Resource     resources/variables/login_variables.resource
