*** Settings ***
Resource                          ../Resources/Base.resource
Test Setup                        Go to Login Page
Test Teardown                     Close the login page

*** Test Cases ***

#TODO: <Login Tests>
TC01 – Autenticação de usuário → Usuário insere credenciais válidas    
    [Documentation]    Teste de login válido 
    [Tags]    TC01    
    Login with credentials    standard
    Check if you went to the expected page    ${titleInventory}

TC10 – Validação de campos obrigatórios → Usuário tenta logar sem preencher username
    [Documentation]    Teste de login sem preencher username
    [Tags]    TC10
    Login with invalid credentials    ${EMPTY}    secret_sauce                
    Check message    Epic sadface: Username is required

TC10B – Validação de campos obrigatórios → Usuário tenta logar sem preencher senha
    [Documentation]    Teste de login sem preencher senha
    [Tags]    TC10
    Login with invalid credentials    standard_user    ${EMPTY}
    Check message    Epic sadface: Password is required    
    
TC07 – Sessão de usuário → Usuário realiza logout
    [Documentation]    Teste de logout
    [Tags]    TC07
    Login with credentials    standard
    Check if you went to the expected page    ${titleInventory}
    Click on "Logout"
    Check if you went to the expected page    ${LOGIN_BUTTON}

TC08 – Validação de autenticação → Usuário insere username inexistente
    [Documentation]    Teste de login com usuário inexistente
    [Tags]    TC08
    Login with invalid credentials    inexistent_user    secret_sauce
    Check message    ${Message}

TC09 – Validação de autenticação → Usuário insere senha incorreta
    [Documentation]    Teste de login com senha incorreta
    [Tags]    TC09
    Login with invalid credentials    standard_user    wrong_password
    Check message    ${Message}

TC11 – Validação de campos → Usuário insere username e senha acima do limite permitido
    [Documentation]    Teste de login com username e senha acima do limite permitido com 255 caracteres
    [Tags]    TC11
    ${long_username}    ${long_password}=    Username and password with 255 characters
    Login with invalid credentials    ${long_username}    ${long_password}
    Check message    ${Message}

TC12 – Segurança do login → Usuário erra a senha várias vezes seguidas
    [Documentation]    Teste de login com várias tentativas de senha incorreta
    [Tags]    TC12
    FOR    ${i}    IN RANGE    6
        Login with invalid credentials    standard_user    wrong_password
        Check message    ${Message}
    END
    
TC13 – Validação de autenticação → Usuário bloqueado não consegue logar
    [Documentation]    Teste de login com usuário bloqueado
    [Tags]    TC13
    Login with credentials    Locked
    Check message    Epic sadface: Sorry, this user has been locked out.

TC14 – Login com usuário problemático
    [Documentation]    Usuário problemático consegue acessar o inventário
    [Tags]    TC14
    Login with credentials    problem
    Check if you went to the expected page    ${titleInventory}

TC15 – Login com usuário de performance
    [Documentation]    Usuário com problema de performance consegue acessar o inventário
    [Tags]    TC15
    Login with credentials    performance_problem
    Check if you went to the expected page    ${titleInventory}

TC16 – Segurança de rotas → Usuário não logado acessa /checkout
    [Documentation]    Teste de acesso à página de checkout sem estar logado
    [Tags]    TC16
    Go To    https://www.saucedemo.com/checkout-step-one.html
    Check if you went to the expected page    ${LOGIN_BUTTON}

TC17 – Carrinho → Adicionar dois itens e validar badge
    [Documentation]    Valida a contagem do carrinho ao adicionar dois itens do inventário
    [Tags]    TC17    cart
    Login with credentials    standard
    Check if you went to the expected page    ${titleInventory}
    Add default items to cart
    Validate cart badge count    2

TC18 – Carrinho → Validar itens adicionados
    [Documentation]    Garante que os itens esperados aparecem no carrinho
    [Tags]    TC18    cart
    Login with credentials    problem
    Check if you went to the expected page    ${titleInventory}
    Add default items to cart
    Open cart
    Validate cart contains items    Sauce Labs Backpack    Sauce Labs Bike Light

TC19 – Checkout completo com dois itens
    [Documentation]    Executa checkout até confirmação final de pedido
    [Tags]    TC19    checkout
    Login with credentials    standard
    Check if you went to the expected page    ${titleInventory}
    Add default items to cart
    Open cart
    Start checkout with customer data    Gabriel    Souza    01001000
    Finish checkout
    Validate checkout complete

Validar o valor total de dois itens do carrinho
    [Documentation]    Valida subtotal esperado para backpack + bike light
    [Tags]    checkout    total
    Login with credentials    standard
    Check if you went to the expected page    ${titleInventory}
    Add default items to cart
    Open cart
    Start checkout with customer data    Gabriel    Souza    01001000
    Validate checkout item total    $39.98

TC20 – Ordenação de produtos A-Z
    [Documentation]    Valida ordenação padrão alfabética ascendente
    [Tags]    TC20    inventory
    Login with credentials    standard
    Check if you went to the expected page    ${titleInventory}
    Sort products by option value    az
    ${first_item}=    Get first inventory item name
    Should Be Equal    ${first_item}    Sauce Labs Backpack


