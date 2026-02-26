*** Settings ***
Resource                          ../Resources/Base.resource
Suite Setup                       Run Keywords    Load Components Test Data    AND    Open Components test session
Test Setup                        Prepare Components test case
Suite Teardown                    Close the login page

*** Test Cases ***
CP01 - Componente App Logo
    [Documentation]    Valida o componente da logo Swag Labs
    [Tags]    components    logo
    Validate Components page ready
    Validate app logo visible
    Validate app logo component    ${COMPONENTS_TEST_DATA}[expected_logo]

CP02 - Componente ícone do carrinho
    [Documentation]    Valida componente do ícone do carrinho
    [Tags]    components    cart-icon
    Validate Components page ready
    Validate cart icon component
    Open cart from header icon
    Validate cart page loaded    Your Cart
    Return to inventory page

CP03 - Componente botão de menu
    [Documentation]    Valida componente botão Open Menu
    [Tags]    components    menu-button
    Validate Components page ready
    Validate menu button component

CP04 - Componente bm-menu e links laterais
    [Documentation]    Valida estrutura do menu lateral e links do componente
    [Tags]    components    menu
    Validate Components page ready
    Open menu component
    Validate menu container visible
    ${menu_items}=    Set Variable    ${COMPONENTS_TEST_DATA}[menu_items]
    Validate bm-menu links component    @{menu_items}
    Close menu component

CP05 - Componente footer copy
    [Documentation]    Valida componente de texto do rodapé
    [Tags]    components    footer
    Validate Components page ready
    Validate footer visible
    Validate footer copy component    ${COMPONENTS_TEST_DATA}[expected_footer_text]
