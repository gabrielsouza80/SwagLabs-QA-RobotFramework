*** Settings ***
Resource    ../../Base.resource

*** Keywords ***
Open HomePage as user
    [Arguments]    ${role}
    Login with credentials    ${role}
    Validate HomePage loaded

Open HomePage test session
    Go to Login Page
    Login with credentials    ${HOMEPAGE_TEST_DATA}[role]
    Validate HomePage loaded

Prepare HomePage test case
    Go To    ${URL}inventory.html
    Validate HomePage loaded
    Reset HomePage application state

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

Validate HomePage title text
    [Arguments]    ${expected_title}
    Element Text Should Be    ${HomePageTitle}    ${expected_title}

Validate HomePage logo text
    [Arguments]    ${expected_logo}
    Element Text Should Be    ${HomePageAppLogo}    ${expected_logo}

Validate HomePage social links
    Page Should Contain Element    ${HomePageTwitterLink}
    Page Should Contain Element    ${HomePageFacebookLink}
    Page Should Contain Element    ${HomePageLinkedinLink}

Open HomePage side menu
    Click Element    ${HomePageMenuButton}
    Wait Until Element Is Visible    ${HomePageMenuLogoutLink}    10s

Close HomePage side menu
    Wait Until Element Is Visible    ${HomePageMenuCloseButton}    10s
    Click Element    ${HomePageMenuCloseButton}

Reset HomePage application state
    Open HomePage side menu
    Wait Until Element Is Visible    ${HomePageMenuResetLink}    10s
    Click Element    ${HomePageMenuResetLink}
    Close HomePage side menu

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

Add backpack from HomePage
    Click Element    ${HomePageAddBackpack}

Add bike light from HomePage
    Click Element    ${HomePageAddBikeLight}

Validate HomePage cart badge
    [Arguments]    ${expected_count}
    Wait Until Element Is Visible    ${HomePageCartBadge}    10s
    Element Text Should Be    ${HomePageCartBadge}    ${expected_count}

Click on "Logout"
    Open HomePage side menu
    Click Element    ${HomePageMenuLogoutLink}

Click HomePage logout option
    Click Element    ${HomePageMenuLogoutLink}

Validate HomePage side menu options
    Page Should Contain Element    ${HomePageMenuInventoryLink}
    Page Should Contain Element    ${HomePageMenuAboutLink}
    Page Should Contain Element    ${HomePageMenuLogoutLink}
    Page Should Contain Element    ${HomePageMenuResetLink}

Load HomePage Test Data
    ${data}=    Load test data file    homepage_test_data.json
    Set Suite Variable    ${HOMEPAGE_TEST_DATA}    ${data}
