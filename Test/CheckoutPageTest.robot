*** Settings ***
Resource                          ../Resources/Base.resource
Suite Setup                       Load Checkout Test Data
Test Setup                        Go to Login Page
Test Teardown                     Close the login page

*** Test Cases ***
CK01 – Cart page carrega com itens esperados
    [Documentation]    Valida estrutura e itens da página de carrinho
    [Tags]    checkout    cart
    ${expected_items}=    Set Variable    ${CHECKOUT_TEST_DATA}[expected_items]
    Prepare cart with two default items    ${CHECKOUT_TEST_DATA}[role]
    Open cart page
    Validate cart page loaded    ${CHECKOUT_TEST_DATA}[expected_titles][cart]
    Validate cart contains expected items    @{expected_items}

CK02 – Checkout information page carrega corretamente
    [Documentation]    Valida transição do carrinho para checkout your information
    [Tags]    checkout    info
    Prepare cart with two default items    ${CHECKOUT_TEST_DATA}[role]
    Open cart page
    Start checkout information step    ${CHECKOUT_TEST_DATA}[expected_titles][information]

CK03 – Checkout overview valida subtotal, taxa e total
    [Documentation]    Valida os valores exibidos no overview
    [Tags]    checkout    overview    total
    ${customer}=    Set Variable    ${CHECKOUT_TEST_DATA}[customer]
    ${totals}=    Set Variable    ${CHECKOUT_TEST_DATA}[expected_totals]
    Prepare cart with two default items    ${CHECKOUT_TEST_DATA}[role]
    Open cart page
    Start checkout information step    ${CHECKOUT_TEST_DATA}[expected_titles][information]
    Fill checkout information    ${customer}[first_name]    ${customer}[last_name]    ${customer}[postal_code]
    Validate checkout overview loaded    ${CHECKOUT_TEST_DATA}[expected_titles][overview]
    Validate checkout totals    ${totals}[item_total]    ${totals}[tax]    ${totals}[total]

CK04 – Checkout complete e retorno para produtos
    [Documentation]    Finaliza pedido e volta para HomePage
    [Tags]    checkout    complete
    ${customer}=    Set Variable    ${CHECKOUT_TEST_DATA}[customer]
    ${complete}=    Set Variable    ${CHECKOUT_TEST_DATA}[complete]
    Prepare cart with two default items    ${CHECKOUT_TEST_DATA}[role]
    Open cart page
    Start checkout information step    ${CHECKOUT_TEST_DATA}[expected_titles][information]
    Fill checkout information    ${customer}[first_name]    ${customer}[last_name]    ${customer}[postal_code]
    Validate checkout overview loaded    ${CHECKOUT_TEST_DATA}[expected_titles][overview]
    Finish checkout flow
    Validate checkout complete page    ${CHECKOUT_TEST_DATA}[expected_titles][complete]    ${complete}[header]    ${complete}[text_contains]
    Go back to products from complete page
