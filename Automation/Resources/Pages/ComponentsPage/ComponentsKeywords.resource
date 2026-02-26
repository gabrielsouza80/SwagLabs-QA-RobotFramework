*** Settings ***
Resource    ../../Base.resource

*** Keywords ***
Open Components page as user
    [Arguments]    ${role}
    Login with credentials    ${role}
    Wait Until Element Is Visible    ${ComponentProductsTitle}    10s

Validate app logo component
    [Arguments]    ${expected_logo_text}
    Wait Until Element Is Visible    ${ComponentAppLogo}    10s
    Element Text Should Be    ${ComponentAppLogo}    ${expected_logo_text}

Validate cart icon component
    Wait Until Element Is Visible    ${ComponentCartLink}    10s

Validate menu button component
    Wait Until Element Is Visible    ${ComponentMenuButton}    10s

Open menu component
    Click Element    ${ComponentMenuButton}
    Wait Until Element Is Visible    ${ComponentMenuContainer}    10s

Close menu component
    Wait Until Element Is Visible    ${ComponentMenuCloseButton}    10s
    Click Element    ${ComponentMenuCloseButton}

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
