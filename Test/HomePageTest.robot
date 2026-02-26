*** Settings ***
Resource                          ../Resources/Base.resource
Suite Setup                       Run Keywords    Load HomePage Test Data    AND    Open HomePage test session
Test Setup                        Prepare HomePage test case
Suite Teardown                    Close the login page

*** Test Cases ***
HP01 - HomePage carrega com componentes principais
    [Documentation]    Valida carregamento da HomePage com elementos essenciais
    [Tags]    homepage    smoke
    Validate HomePage loaded
    Validate HomePage title text    ${HOMEPAGE_TEST_DATA}[expected_title]
    Validate HomePage logo text    ${HOMEPAGE_TEST_DATA}[expected_logo]
    Validate HomePage social links

HP02 - HomePage abre e fecha menu lateral
    [Documentation]    Valida a interação de abrir e fechar menu na HomePage
    [Tags]    homepage    interaction
    Validate HomePage loaded
    Open HomePage side menu
    Validate HomePage side menu options
    Close HomePage side menu

HP03 - HomePage ordena produtos de Z-A
    [Documentation]    Valida troca da ordenação para Name (Z to A)
    [Tags]    homepage    sorting
    Validate HomePage loaded
    Sort HomePage products by    ${HOMEPAGE_TEST_DATA}[sort_za_value]
    Validate active sort option    ${HOMEPAGE_TEST_DATA}[sort_za_label]

HP04 - HomePage badge do carrinho com dois itens
    [Documentation]    Adiciona dois itens e valida badge do carrinho
    [Tags]    homepage    cart
    Validate HomePage loaded
    Add backpack from HomePage
    Add bike light from HomePage
    Validate HomePage cart badge    ${HOMEPAGE_TEST_DATA}[expected_cart_badge]

HP05 - HomePage logout pelo menu lateral
    [Documentation]    Realiza logout a partir do menu lateral
    [Tags]    homepage    session
    Validate HomePage loaded
    Open HomePage side menu
    Click HomePage logout option
    Check if you went to the expected page    ${LOGIN_BUTTON}
