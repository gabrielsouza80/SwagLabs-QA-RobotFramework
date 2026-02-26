*** Settings ***
Resource                          ../Resources/Base.resource
Suite Setup                       Run Keywords    Load HomePage Test Data    AND    Open HomePage test session
Test Setup                        Prepare HomePage test case
Suite Teardown                    Close the login page

*** Test Cases ***
HP01 - HomePage loads with main components
    [Documentation]    Validates HomePage load with essential elements
    [Tags]    homepage    smoke
    Validate HomePage loaded
    Validate HomePage title text    ${HOMEPAGE_TEST_DATA}[expected_title]
    Validate HomePage logo text    ${HOMEPAGE_TEST_DATA}[expected_logo]
    Validate HomePage social links

HP02 - HomePage opens and closes side menu
    [Documentation]    Validates side menu open/close interaction on HomePage
    [Tags]    homepage    interaction
    Validate HomePage loaded
    Open HomePage side menu
    Validate HomePage side menu options
    Close HomePage side menu

HP03 - HomePage sorts products from Z to A
    [Documentation]    Validates sorting change to Name (Z to A)
    [Tags]    homepage    sorting
    Validate HomePage loaded
    Sort HomePage products by    ${HOMEPAGE_TEST_DATA}[sort_za_value]
    Validate active sort option    ${HOMEPAGE_TEST_DATA}[sort_za_label]

HP04 - HomePage cart badge with two items
    [Documentation]    Adds two items and validates cart badge
    [Tags]    homepage    cart
    Validate HomePage loaded
    Add backpack from HomePage
    Add bike light from HomePage
    Validate HomePage cart badge    ${HOMEPAGE_TEST_DATA}[expected_cart_badge]

HP05 - HomePage logout through side menu
    [Documentation]    Performs logout through side menu
    [Tags]    homepage    session
    Validate HomePage loaded
    Open HomePage side menu
    Click HomePage logout option
    Check if you went to the expected page    ${LOGIN_BUTTON}
