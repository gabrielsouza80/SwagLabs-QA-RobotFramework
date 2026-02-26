*** Settings ***
Resource                          ../Resources/Base.resource
Suite Setup                       Load Login Test Data
Test Setup                        Go to Login Page
Test Teardown                     Close the login page

*** Test Cases ***

#TODO: <Login Tests>
TC01 - Autenticacao de usuario - Usuario insere credenciais validas
    [Documentation]    Teste de login válido 
    [Tags]    TC01    
    Login with credentials    ${LOGIN_TEST_DATA}[valid_role]
    Check if you went to the expected page    ${titleInventory}

TC10 - Validacao de campos obrigatorios - Usuario tenta logar sem preencher username
    [Documentation]    Teste de login sem preencher username
    [Tags]    TC10
    Login with invalid credentials    ${LOGIN_TEST_DATA}[empty_value]    ${LOGIN_TEST_DATA}[valid_password]
    Check message    ${LOGIN_TEST_DATA}[required_username_message]

TC10B - Validacao de campos obrigatorios - Usuario tenta logar sem preencher senha
    [Documentation]    Teste de login sem preencher senha
    [Tags]    TC10
    Login with invalid credentials    ${LOGIN_TEST_DATA}[standard_username]    ${LOGIN_TEST_DATA}[empty_value]
    Check message    ${LOGIN_TEST_DATA}[required_password_message]
    
TC07 - Sessao de usuario - Usuario realiza logout
    [Documentation]    Teste de logout
    [Tags]    TC07
    Login with credentials    ${LOGIN_TEST_DATA}[valid_role]
    Check if you went to the expected page    ${titleInventory}
    Click on "Logout"
    Check if you went to the expected page    ${LOGIN_BUTTON}

TC08 - Validacao de autenticacao - Usuario insere username inexistente
    [Documentation]    Teste de login com usuário inexistente
    [Tags]    TC08
    Login with invalid credentials    ${LOGIN_TEST_DATA}[invalid_username]    ${LOGIN_TEST_DATA}[valid_password]
    Check message    ${LOGIN_TEST_DATA}[invalid_credentials_message]

TC09 - Validacao de autenticacao - Usuario insere senha incorreta
    [Documentation]    Teste de login com senha incorreta
    [Tags]    TC09
    Login with invalid credentials    ${LOGIN_TEST_DATA}[standard_username]    ${LOGIN_TEST_DATA}[wrong_password]
    Check message    ${LOGIN_TEST_DATA}[invalid_credentials_message]

TC11 - Validacao de campos - Usuario insere username e senha acima do limite permitido
    [Documentation]    Teste de login com username e senha acima do limite permitido com 255 caracteres
    [Tags]    TC11
    ${long_username}    ${long_password}=    Username and password with 255 characters    ${LOGIN_TEST_DATA}[max_length]
    Login with invalid credentials    ${long_username}    ${long_password}
    Check message    ${LOGIN_TEST_DATA}[invalid_credentials_message]

TC12 - Seguranca do login - Usuario erra a senha varias vezes seguidas
    [Documentation]    Teste de login com várias tentativas de senha incorreta
    [Tags]    TC12
    FOR    ${i}    IN RANGE    ${LOGIN_TEST_DATA}[invalid_attempts]
        Login with invalid credentials    ${LOGIN_TEST_DATA}[standard_username]    ${LOGIN_TEST_DATA}[wrong_password]
        Check message    ${LOGIN_TEST_DATA}[invalid_credentials_message]
    END
    
TC13 - Validacao de autenticacao - Usuario bloqueado nao consegue logar
    [Documentation]    Teste de login com usuário bloqueado
    [Tags]    TC13
    Login with credentials    ${LOGIN_TEST_DATA}[locked_role]
    Check message    ${LOGIN_TEST_DATA}[locked_user_message]

TC14 - Login com usuario problematico
    [Documentation]    Usuário problemático consegue acessar o inventário
    [Tags]    TC14
    Login with credentials    ${LOGIN_TEST_DATA}[problem_role]
    Check if you went to the expected page    ${titleInventory}

TC15 - Login com usuario de performance
    [Documentation]    Usuário com problema de performance consegue acessar o inventário
    [Tags]    TC15
    Login with credentials    ${LOGIN_TEST_DATA}[performance_role]
    Check if you went to the expected page    ${titleInventory}

TC16 - Seguranca de rotas - Usuario nao logado acessa /checkout
    [Documentation]    Teste de acesso à página de checkout sem estar logado
    [Tags]    TC16
    Go To    ${LOGIN_TEST_DATA}[unauthorized_checkout_url]
    Check if you went to the expected page    ${LOGIN_USERNAME_FIELD}


