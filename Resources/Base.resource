*** Settings ***
Library         SeleniumLibrary
Library         Collections
Library         OperatingSystem


#Keywords
Resource        ./Pages/LoginPage/LoginKeywords.resource
Resource        ./Pages/HomePage/HomePageKeywords.resource
Resource        ./Pages/ComponentsPage/ComponentsKeywords.resource
Resource        ./Pages/CheckoutPage/CheckoutKeywords.resource

#locators
Resource        ./Pages/LoginPage/LoginLocators.resource
Resource        ./Pages/HomePage/HomePageLocators.resource
Resource        ./Pages/ComponentsPage/ComponentsLocators.resource
Resource        ./Pages/CheckoutPage/CheckoutLocators.resource

*** Variables ***
${URL}         https://www.saucedemo.com/
${BROWSER}     Edge
${HEADLESS}    ${True}
${DataFolder}  Data
${LOGIN_TEST_DATA}         ${None}
${HOMEPAGE_TEST_DATA}      ${None}
${COMPONENTS_TEST_DATA}    ${None}
${CHECKOUT_TEST_DATA}      ${None}




${CredentialsJson}             Resources/Settings/credentials.json


*** Keywords ***
Go to Login Page
    IF    ${HEADLESS}
        ${edge_options}=    Evaluate    sys.modules['selenium.webdriver'].EdgeOptions()    sys, selenium.webdriver
        Call Method    ${edge_options}    add_argument    --headless
        Call Method    ${edge_options}    add_argument    --disable-gpu
        Call Method    ${edge_options}    add_argument    --window-size\=1920,1080
        Create Webdriver    Edge    options=${edge_options}
        Go To    ${URL}
    ELSE
        Open Browser    ${URL}    ${BROWSER}
    END

    
Close the login page
    Run Keyword And Ignore Error    Run Keyword If Test Failed    Capture Page Screenshot
    Close Browser

Load test data file
    [Arguments]    ${file_name}
    ${file_path}=    Set Variable    ${DataFolder}/${file_name}
    ${json_text}=    Get File    ${file_path}
    ${json_data}=    Evaluate    json.loads(r'''${json_text}''')    modules=json
    RETURN    ${json_data}

