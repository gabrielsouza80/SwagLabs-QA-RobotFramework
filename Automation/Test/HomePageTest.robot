*** Settings ***
Resource                          ../Resources/Base.resource
Suite Setup                       Load HomePage Test Data
Test Setup                        Go to Login Page
Test Teardown                     Close the login page

*** Test Cases ***
HP01 – HomePage carrega com componentes principais
    [Documentation]    Valida carregamento da HomePage com elementos essenciais
    [Tags]    homepage    smoke
    Open HomePage as user    ${HOMEPAGE_TEST_DATA}[role]
    Validate HomePage static components    ${HOMEPAGE_TEST_DATA}[expected_title]    ${HOMEPAGE_TEST_DATA}[expected_logo]

HP02 – HomePage abre e fecha menu lateral
    [Documentation]    Valida a interação de abrir e fechar menu na HomePage
    [Tags]    homepage    interaction
    Open HomePage as user    ${HOMEPAGE_TEST_DATA}[role]
    Open HomePage side menu
    Close HomePage side menu

HP03 – HomePage ordena produtos de Z-A
    [Documentation]    Valida troca da ordenação para Name (Z to A)
    [Tags]    homepage    sorting
    Open HomePage as user    ${HOMEPAGE_TEST_DATA}[role]
    Sort HomePage products by    ${HOMEPAGE_TEST_DATA}[sort_za_value]
    Validate active sort option    ${HOMEPAGE_TEST_DATA}[sort_za_label]

HP04 – HomePage badge do carrinho com dois itens
    [Documentation]    Adiciona dois itens e valida badge do carrinho
    [Tags]    homepage    cart
    Open HomePage as user    ${HOMEPAGE_TEST_DATA}[role]
    Add two default products from HomePage
    Validate HomePage cart badge    ${HOMEPAGE_TEST_DATA}[expected_cart_badge]

HP05 – HomePage logout pelo menu lateral
    [Documentation]    Realiza logout a partir do menu lateral
    [Tags]    homepage    session
    Open HomePage as user    ${HOMEPAGE_TEST_DATA}[role]
    Logout from HomePage side menu
    Check if you went to the expected page    ${LOGIN_BUTTON}

*** Keywords ***
Load HomePage Test Data
    ${data}=    Load test data file    homepage_test_data.json
    Set Suite Variable    ${HOMEPAGE_TEST_DATA}    ${data}
