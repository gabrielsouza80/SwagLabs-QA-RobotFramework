*** Settings ***
Resource                          ../Resources/Base.resource
Suite Setup                       Run Keywords    Load Checkout Test Data    AND    Open Checkout test session
Test Setup                        Prepare Checkout test case
Suite Teardown                    Close the login page

*** Test Cases ***
CK01 - Cart page loads with expected items
    [Documentation]    Validates cart page structure and items
    [Tags]    checkout    cart
    ${expected_items}=    Set Variable    ${CHECKOUT_TEST_DATA}[expected_items]
    Prepare cart with two default items
    Open cart page
    Validate cart page loaded    ${CHECKOUT_TEST_DATA}[expected_titles][cart]
    Validate cart contains expected items    @{expected_items}

CK02 - Checkout information page loads correctly
    [Documentation]    Validates transition from cart to Checkout: Your Information
    [Tags]    checkout    info
    Prepare cart with two default items
    Open cart page
    Start checkout information step    ${CHECKOUT_TEST_DATA}[expected_titles][information]

CK03 - Checkout overview validates subtotal, tax and total
    [Documentation]    Validates totals shown in overview
    [Tags]    checkout    overview    total
    ${customer}=    Set Variable    ${CHECKOUT_TEST_DATA}[customer]
    ${totals}=    Set Variable    ${CHECKOUT_TEST_DATA}[expected_totals]
    Prepare cart with two default items
    Open cart page
    Start checkout information step    ${CHECKOUT_TEST_DATA}[expected_titles][information]
    Fill checkout information    ${customer}[first_name]    ${customer}[last_name]    ${customer}[postal_code]
    Validate checkout overview loaded    ${CHECKOUT_TEST_DATA}[expected_titles][overview]
    Validate checkout totals    ${totals}[item_total]    ${totals}[tax]    ${totals}[total]

CK04 - Checkout complete and return to products
    [Documentation]    Completes the order and returns to HomePage
    [Tags]    checkout    complete
    ${customer}=    Set Variable    ${CHECKOUT_TEST_DATA}[customer]
    ${complete}=    Set Variable    ${CHECKOUT_TEST_DATA}[complete]
    Prepare cart with two default items
    Open cart page
    Start checkout information step    ${CHECKOUT_TEST_DATA}[expected_titles][information]
    Fill checkout information    ${customer}[first_name]    ${customer}[last_name]    ${customer}[postal_code]
    Validate checkout overview loaded    ${CHECKOUT_TEST_DATA}[expected_titles][overview]
    Finish checkout flow
    Validate checkout complete page    ${CHECKOUT_TEST_DATA}[expected_titles][complete]    ${complete}[header]    ${complete}[text_contains]
    Go back to products from complete page
