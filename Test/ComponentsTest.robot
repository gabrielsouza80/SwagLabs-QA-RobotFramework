*** Settings ***
Resource                          ../Resources/Base.resource
Suite Setup                       Run Keywords    Load Components Test Data    AND    Open Components test session
Test Setup                        Prepare Components test case
Suite Teardown                    Close the login page

*** Test Cases ***
CP01 - App Logo component
    [Documentation]    Validates Swag Labs logo component
    [Tags]    components    logo
    Validate Components page ready
    Validate app logo visible
    Validate app logo component    ${COMPONENTS_TEST_DATA}[expected_logo]

CP02 - Cart icon component
    [Documentation]    Validates cart icon component
    [Tags]    components    cart-icon
    Validate Components page ready
    Validate cart icon component
    Open cart from header icon
    Validate cart page loaded    Your Cart
    Return to inventory page

CP03 - Menu button component
    [Documentation]    Validates Open Menu button component
    [Tags]    components    menu-button
    Validate Components page ready
    Validate menu button component

CP04 - bm-menu and side links component
    [Documentation]    Validates side menu structure and component links
    [Tags]    components    menu
    Validate Components page ready
    Open menu component
    Validate menu container visible
    ${menu_items}=    Set Variable    ${COMPONENTS_TEST_DATA}[menu_items]
    Validate bm-menu links component    @{menu_items}
    Close menu component

CP05 - Footer copy component
    [Documentation]    Validates footer text component
    [Tags]    components    footer
    Validate Components page ready
    Validate footer visible
    Validate footer copy component    ${COMPONENTS_TEST_DATA}[expected_footer_text]
