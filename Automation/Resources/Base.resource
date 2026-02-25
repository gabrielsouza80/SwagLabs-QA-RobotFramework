*** Settings ***
Library         SeleniumLibrary
Library         Collections
Library         OperatingSystem


#Keywords
Resource        ./Pages/LoginPage/LoginKeywords.resource
Resource        ./Pages/InventoryPage/InventoryKeywords.resource

#locators
Resource        ./Pages/LoginPage/LoginLocators.resource
Resource        ./Pages/InventoryPage/InventoryLocators.resource

*** Variables ***
${URL}         https://www.saucedemo.com/
${BROWSER}     Edge




${CredentialsJson}             Automation/Resources/Settings/credentials.json


*** Keywords ***
Go to Login Page
    # Abre o navegador com os argumentos
    Open Browser    ${URL}    ${BROWSER}    

    
Close the login page
    Capture Page Screenshot
    Close Browser

