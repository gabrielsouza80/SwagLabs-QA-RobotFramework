*** Settings ***
Resource    ../../Base.resource

*** Keywords ***
Open HomePage as user
    [Arguments]    ${role}
    Login with credentials    ${role}
    Validate HomePage loaded

Validate HomePage loaded
    Wait Until Element Is Visible    ${HomePageTitle}    10s
    Wait Until Element Is Visible    ${HomePageAppLogo}    10s
    Wait Until Element Is Visible    ${HomePageSortSelect}    10s
    Wait Until Element Is Visible    ${HomePageInventoryList}    10s

Validate HomePage static components
    [Arguments]    ${expected_title}    ${expected_logo}
    Element Text Should Be    ${HomePageTitle}    ${expected_title}
    Element Text Should Be    ${HomePageAppLogo}    ${expected_logo}
    Page Should Contain Element    ${HomePageTwitterLink}
    Page Should Contain Element    ${HomePageFacebookLink}
    Page Should Contain Element    ${HomePageLinkedinLink}

Open HomePage side menu
    Click Element    ${HomePageMenuButton}
    Wait Until Element Is Visible    ${HomePageMenuLogoutLink}    10s

Close HomePage side menu
    Wait Until Element Is Visible    ${HomePageMenuCloseButton}    10s
    Click Element    ${HomePageMenuCloseButton}

Logout from HomePage side menu
    Open HomePage side menu
    Click Element    ${HomePageMenuLogoutLink}

Sort HomePage products by
    [Arguments]    ${sort_value}
    Select From List By Value    ${HomePageSortSelect}    ${sort_value}

Validate active sort option
    [Arguments]    ${expected_label}
    Wait Until Element Is Visible    ${HomePageActiveSortOption}    10s
    Element Text Should Be    ${HomePageActiveSortOption}    ${expected_label}

Add two default products from HomePage
    Click Element    ${HomePageAddBackpack}
    Click Element    ${HomePageAddBikeLight}

Validate HomePage cart badge
    [Arguments]    ${expected_count}
    Wait Until Element Is Visible    ${HomePageCartBadge}    10s
    Element Text Should Be    ${HomePageCartBadge}    ${expected_count}
