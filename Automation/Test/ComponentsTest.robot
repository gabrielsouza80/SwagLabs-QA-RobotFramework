*** Settings ***
Resource                          ../Resources/Base.resource
Suite Setup                       Load Components Test Data
Test Setup                        Go to Login Page
Test Teardown                     Close the login page

*** Test Cases ***
CP01 – Componente App Logo
    [Documentation]    Valida o componente da logo Swag Labs
    [Tags]    components    logo
    Open Components page as user    ${COMPONENTS_TEST_DATA}[role]
    Validate app logo component    ${COMPONENTS_TEST_DATA}[expected_logo]

CP02 – Componente ícone do carrinho
    [Documentation]    Valida componente do ícone do carrinho
    [Tags]    components    cart-icon
    Open Components page as user    ${COMPONENTS_TEST_DATA}[role]
    Validate cart icon component

CP03 – Componente botão de menu
    [Documentation]    Valida componente botão Open Menu
    [Tags]    components    menu-button
    Open Components page as user    ${COMPONENTS_TEST_DATA}[role]
    Validate menu button component

CP04 – Componente bm-menu e links laterais
    [Documentation]    Valida estrutura do menu lateral e links do componente
    [Tags]    components    menu
    Open Components page as user    ${COMPONENTS_TEST_DATA}[role]
    Open menu component
    ${menu_items}=    Set Variable    ${COMPONENTS_TEST_DATA}[menu_items]
    Validate bm-menu links component    @{menu_items}
    Close menu component

CP05 – Componente footer copy
    [Documentation]    Valida componente de texto do rodapé
    [Tags]    components    footer
    Open Components page as user    ${COMPONENTS_TEST_DATA}[role]
    Validate footer copy component    ${COMPONENTS_TEST_DATA}[expected_footer_text]

*** Keywords ***
Load Components Test Data
    ${data}=    Load test data file    components_test_data.json
    Set Suite Variable    ${COMPONENTS_TEST_DATA}    ${data}
