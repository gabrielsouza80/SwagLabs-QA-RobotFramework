*** Settings ***
Resource    ../../Base.resource

*** Variables ***
${LOGIN_USERNAME_FIELD}                                css:input[id*="user-name"]
${LOGIN_PASSWORD_FIELD}                                css:input[id="password"]
${LOGIN_BUTTON}                                        css:input[id="login-button"]
${Message}                                             Epic sadface: Username and password do not match any user in this service
