*** Settings ***
Resource    ../../Base.resource

*** Variables ***
${CredentialsJson}    ../Settings/credentials.json

*** Keywords ***
Login with credentials
    [Arguments]    ${role}

    ${is_login_page}=    Run Keyword And Return Status    Page Should Contain Element    ${LOGIN_USERNAME_FIELD}
    IF    not ${is_login_page}
        Go To    ${URL}
    END
    Wait Until Element Is Visible    ${LOGIN_USERNAME_FIELD}    10s

    # Carrega o arquivo JSON contendo as credenciais
    ${credentials_json}=    Get File    ${CredentialsJson}
    ${credentials}=    Evaluate    json.loads(r'''${credentials_json}''')    modules=json

    # Pega a lista "users" do JSON
    ${users}=    Get From Dictionary    ${credentials}    users
    
    #variavel para armazenar o dicionário do usuário encontrado
    ${user_dictionary}=    Set Variable    ${None}
    
    # Percorre a lista de usuários procurando aquele cujo campo "role" corresponde ao argumento ${role}
    FOR    ${i}    IN    @{users}                                                                               # Inicia um loop, onde ${i} representa cada usuário (dicionário) da lista @{users}
        ${user_role}=    Get From Dictionary    ${i}    role                                                    # Pega o valor da chave "role" dentro do dicionário atual (${i}) e armazena em ${user_role}
        Run Keyword If    '${user_role}' == '${role}'    Set Test Variable    ${user_dictionary}    ${i}        # Se o "role" do usuário atual for igual ao argumento passado (${role}), guarda esse dicionário em ${user_dictionary}
        Exit For Loop If    ${user_dictionary}                                                                  # Sai imediatamente do loop se ${user_dictionary} já estiver definido (ou seja, usuário encontrado)
    END                                                                                                         # Marca o fim do loop FOR

    # Se não encontrou nenhum usuário com o role informado, falha o teste com mensagem clara
    IF    not ${user_dictionary}
        Fail    No user found with role "${role}"
    END


    # Extrai username e password do dicionário encontrado
    ${username}=    Get From Dictionary    ${user_dictionary}    username
    ${password}=    Get From Dictionary    ${user_dictionary}    password

    # Preenche os campos de login e submete
    Input Text    ${LOGIN_USERNAME_FIELD}    ${username}
    Input Text    ${LOGIN_PASSWORD_FIELD}    ${password}
    Click Button    ${LOGIN_BUTTON}

Check if you went to the expected page            
    [Arguments]    ${LocatorPageExpected}
    Page Should Contain Element    ${LocatorPageExpected}

Check Message
    [Arguments]    ${mensagem_esperada}
    Page Should Contain    ${mensagem_esperada}    

Login with invalid credentials
    [Arguments]    ${username}    ${password}
    Input Text    ${LOGIN_USERNAME_FIELD}    ${username}
    Input Text    ${LOGIN_PASSWORD_FIELD}    ${password}
    Click Button    ${LOGIN_BUTTON}


Username and password with 255 characters
    [Documentation]    Gera username e password com 255 caracteres
    [Tags]    TC11
    [Arguments]    ${length}=255
    ${long_username}=    Evaluate    'a'*int(${length})
    ${long_password}=    Evaluate    'b'*int(${length})
    RETURN    ${long_username}    ${long_password}

Click Login
    Click Button    ${LOGIN_BUTTON}

Load Login Test Data
    ${data}=    Load test data file    login_test_data.json
    Set Suite Variable    ${LOGIN_TEST_DATA}    ${data}



    