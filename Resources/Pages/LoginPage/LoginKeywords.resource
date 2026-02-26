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

    # Loads the JSON file containing credentials
    ${credentials_json}=    Get File    ${CredentialsJson}
    ${credentials}=    Evaluate    json.loads(r'''${credentials_json}''')    modules=json

    # Gets the "users" list from JSON
    ${users}=    Get From Dictionary    ${credentials}    users
    
    # Variable used to store the matching user dictionary
    ${user_dictionary}=    Set Variable    ${None}
    
    # Loops through users and finds the one whose "role" matches ${role}
    FOR    ${i}    IN    @{users}
        ${user_role}=    Get From Dictionary    ${i}    role
        Run Keyword If    '${user_role}' == '${role}'    Set Test Variable    ${user_dictionary}    ${i}
        Exit For Loop If    ${user_dictionary}
    END

    # If no user matches the requested role, fail the test with a clear message
    IF    not ${user_dictionary}
        Fail    No user found with role "${role}"
    END


    # Extracts username and password from the matched dictionary
    ${username}=    Get From Dictionary    ${user_dictionary}    username
    ${password}=    Get From Dictionary    ${user_dictionary}    password

    # Fills login fields and submits
    Input Text    ${LOGIN_USERNAME_FIELD}    ${username}
    Input Text    ${LOGIN_PASSWORD_FIELD}    ${password}
    Click Button    ${LOGIN_BUTTON}

Check if you went to the expected page            
    [Arguments]    ${LocatorPageExpected}
    Page Should Contain Element    ${LocatorPageExpected}

Check Message
    [Arguments]    ${expected_message}
    Page Should Contain    ${expected_message}

Login with invalid credentials
    [Arguments]    ${username}    ${password}
    Input Text    ${LOGIN_USERNAME_FIELD}    ${username}
    Input Text    ${LOGIN_PASSWORD_FIELD}    ${password}
    Click Button    ${LOGIN_BUTTON}


Username and password with 255 characters
    [Documentation]    Generates username and password with 255 characters
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



    