*** Settings ***
Resource    ../../Base.resource

*** Keywords ***
Open Components page as user
    [Arguments]    ${role}
    Login with credentials    ${role}
    Wait Until Element Is Visible    ${ComponentProductsTitle}    10s

Open Components test session
    Go to Login Page
    Login with credentials    ${COMPONENTS_TEST_DATA}[role]
    Wait Until Element Is Visible    ${ComponentProductsTitle}    10s

Prepare Components test case
    Prepare HomePage test case
    Wait Until Element Is Visible    ${ComponentProductsTitle}    10s

Validate Components page ready
    Wait Until Element Is Visible    ${ComponentProductsTitle}    10s

Validate app logo visible
    Wait Until Element Is Visible    ${ComponentAppLogo}    10s

Validate app logo component
    [Arguments]    ${expected_logo_text}
    Wait Until Element Is Visible    ${ComponentAppLogo}    10s
    Element Text Should Be    ${ComponentAppLogo}    ${expected_logo_text}

Validate cart icon component
    Wait Until Element Is Visible    ${ComponentCartLink}    10s

Open cart from header icon
    Click Element    ${ComponentCartLink}

Return to inventory page
    Go To    ${URL}inventory.html
    Validate HomePage loaded

Validate menu button component
    Wait Until Element Is Visible    ${ComponentMenuButton}    10s

Open menu component
    Click Element    ${ComponentMenuButton}
    Wait Until Element Is Visible    ${ComponentMenuContainer}    10s

Validate menu container visible
    Wait Until Element Is Visible    ${ComponentMenuContainer}    10s

Close menu component
    Wait Until Element Is Visible    ${ComponentMenuCloseButton}    10s
    ${clicked}=    Run Keyword And Return Status    Click Element    ${ComponentMenuCloseButton}
    IF    not ${clicked}
        Execute JavaScript    document.querySelector('#react-burger-cross-btn').click();
    END

Validate bm-menu links component
    [Arguments]    @{expected_menu_items}
    Page Should Contain Element    ${ComponentMenuItemList}
    Page Should Contain Element    ${ComponentMenuInventoryLink}
    Page Should Contain Element    ${ComponentMenuAboutLink}
    Page Should Contain Element    ${ComponentMenuLogoutLink}
    Page Should Contain Element    ${ComponentMenuResetLink}
    FOR    ${menu_item}    IN    @{expected_menu_items}
        Page Should Contain    ${menu_item}
    END

Validate footer copy component
    [Arguments]    ${expected_footer_text}
    Wait Until Element Is Visible    ${ComponentFooterCopy}    10s
    Element Should Contain    ${ComponentFooterCopy}    ${expected_footer_text}

Validate footer visible
    Wait Until Element Is Visible    ${ComponentFooterCopy}    10s

Load Components Test Data
    ${data}=    Load test data file    components_test_data.json
    Set Suite Variable    ${COMPONENTS_TEST_DATA}    ${data}
