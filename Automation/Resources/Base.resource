*** Settings ***
Library         SeleniumLibrary
Library         Collections
Library         OperatingSystem


#Keywords
Resource        ./Pages/LoginPage/LoginKeywords.resource
Resource        ./Pages/InventoryPage/InventoryKeywords.resource
Resource        ./Pages/HomePage/HomePageKeywords.resource
Resource        ./Pages/ComponentsPage/ComponentsKeywords.resource
Resource        ./Pages/CheckoutPage/CheckoutKeywords.resource

#locators
Resource        ./Pages/LoginPage/LoginLocators.resource
Resource        ./Pages/InventoryPage/InventoryLocators.resource
Resource        ./Pages/HomePage/HomePageLocators.resource
Resource        ./Pages/ComponentsPage/ComponentsLocators.resource
Resource        ./Pages/CheckoutPage/CheckoutLocators.resource

*** Variables ***
${URL}         https://www.saucedemo.com/
${BROWSER}     Edge
${DataFolder}  Automation/Data




${CredentialsJson}             Automation/Resources/Settings/credentials.json


*** Keywords ***
Go to Login Page
    # Abre o navegador com os argumentos
    Open Browser    ${URL}    ${BROWSER}    

    
Close the login page
    Capture Page Screenshot
    Close Browser

Load test data file
    [Arguments]    ${file_name}
    ${file_path}=    Set Variable    ${DataFolder}/${file_name}
    ${json_text}=    Get File    ${file_path}
    ${json_data}=    Evaluate    json.loads(r'''${json_text}''')    modules=json
    RETURN    ${json_data}

