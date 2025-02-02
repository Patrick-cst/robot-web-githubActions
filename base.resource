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
Resource     resources/keywords/Product_keyword.resource
Resource     resources/keywords/cart_keyword.resource

## Locators
Resource     resources/locators/login_page.resource
Variables    resources/locators/cartLocators.yml
Variables    resources/locators/productsLocators.yml
Variables    resources/locators/cartLocators.yml

## Variables
Resource     resources/variables/common_variables.resource
Resource     resources/variables/login_variables.resource
