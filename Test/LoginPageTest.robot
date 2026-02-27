*** Settings ***
Resource                          ../Resources/Base.resource
Suite Setup                       Load Login Test Data
Test Setup                        Go to Login Page
Test Teardown                     Close the login page

*** Test Cases ***

#TODO: <Login Tests>
TC01 - User authentication - User submits valid credentials
    [Documentation]    Valid login test
    [Tags]    TC01    
    Login with credentials    ${LOGIN_TEST_DATA}[valid_role]
    Check if you went to the expected page    ${titleInventory}

TC02 - Required fields validation - User tries to log in without username
    [Documentation]    Login test without username
    [Tags]    TC02
    Login with invalid credentials    ${LOGIN_TEST_DATA}[empty_value]    ${LOGIN_TEST_DATA}[valid_password]
    Check message    ${LOGIN_TEST_DATA}[required_username_message]

TC03 - Required fields validation - User tries to log in without password
    [Documentation]    Login test without password
    [Tags]    TC03
    Login with invalid credentials    ${LOGIN_TEST_DATA}[standard_username]    ${LOGIN_TEST_DATA}[empty_value]
    Check message    ${LOGIN_TEST_DATA}[required_password_message]
    
TC04 - User session - User performs logout
    [Documentation]    Logout test
    [Tags]    TC04
    Login with credentials    ${LOGIN_TEST_DATA}[valid_role]
    Check if you went to the expected page    ${titleInventory}
    Click on "Logout"
    Check if you went to the expected page    ${LOGIN_BUTTON}

TC05 - Authentication validation - User submits non-existing username
    [Documentation]    Login test with non-existing username
    [Tags]    TC05
    Login with invalid credentials    ${LOGIN_TEST_DATA}[invalid_username]    ${LOGIN_TEST_DATA}[valid_password]
    Check message    ${LOGIN_TEST_DATA}[invalid_credentials_message]

TC06 - Authentication validation - User submits incorrect password
    [Documentation]    Login test with incorrect password
    [Tags]    TC06
    Login with invalid credentials    ${LOGIN_TEST_DATA}[standard_username]    ${LOGIN_TEST_DATA}[wrong_password]
    Check message    ${LOGIN_TEST_DATA}[invalid_credentials_message]

TC07 - Field validation - User submits username and password above allowed limit
    [Documentation]    Login test with username and password above the 255-character limit
    [Tags]    TC07
    ${long_username}    ${long_password}=    Username and password with 255 characters    ${LOGIN_TEST_DATA}[max_length]
    Login with invalid credentials    ${long_username}    ${long_password}
    Check message    ${LOGIN_TEST_DATA}[invalid_credentials_message]

TC08 - Login security - User enters wrong password multiple times
    [Documentation]    Login test with multiple wrong-password attempts
    [Tags]    TC08
    FOR    ${i}    IN RANGE    ${LOGIN_TEST_DATA}[invalid_attempts]
        Login with invalid credentials    ${LOGIN_TEST_DATA}[standard_username]    ${LOGIN_TEST_DATA}[wrong_password]
        Check message    ${LOGIN_TEST_DATA}[invalid_credentials_message]
    END
    
TC09 - Authentication validation - Locked user cannot log in
    [Documentation]    Login test with locked user
    [Tags]    TC09
    Login with credentials    ${LOGIN_TEST_DATA}[locked_role]
    Check message    ${LOGIN_TEST_DATA}[locked_user_message]

TC10 - Login with problem user
    [Documentation]    Problem user can access the inventory page
    [Tags]    TC10
    Login with credentials    ${LOGIN_TEST_DATA}[problem_role]
    Check if you went to the expected page    ${titleInventory}

TC11 - Login with performance user
    [Documentation]    Performance user can access the inventory page
    [Tags]    TC11
    Login with credentials    ${LOGIN_TEST_DATA}[performance_role]
    Check if you went to the expected page    ${titleInventory}

TC12 - Route security - Unauthenticated user accesses /checkout
    [Documentation]    Access test for checkout page without being logged in
    [Tags]    TC12
    Go To    ${LOGIN_TEST_DATA}[unauthorized_checkout_url]
    Check if you went to the expected page    ${LOGIN_USERNAME_FIELD}


