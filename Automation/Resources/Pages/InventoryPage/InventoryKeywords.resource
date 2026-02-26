*** Settings ***
Resource    ../../Base.resource

*** Keywords ***
Click on "Logout"
    Click Element    ${BtnOpenMenu}
    Wait Until Element Is Visible    ${ABtnLogout}    10s
    Click Element    ${ABtnLogout}
    