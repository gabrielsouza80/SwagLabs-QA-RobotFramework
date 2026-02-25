*** Settings ***
Resource    ../../Base.resource

*** Keywords ***
Click on "Logout"
    Click Element    ${BtnOpenMenu}
    Wait Until Element Is Visible    ${ABtnLogout}    10s
    Click Element    ${ABtnLogout}

Add default items to cart
    Wait Until Element Is Visible    ${BtnAddBackpack}    10s
    Click Element    ${BtnAddBackpack}
    Click Element    ${BtnAddBikeLight}

Open cart
    Click Element    ${CartLink}

Validate cart badge count
    [Arguments]    ${expected_count}
    Wait Until Element Is Visible    ${CartBadge}    10s
    Element Text Should Be    ${CartBadge}    ${expected_count}

Validate cart contains items
    [Arguments]    @{expected_items}
    FOR    ${item}    IN    @{expected_items}
        Page Should Contain    ${item}
    END

Start checkout with customer data
    [Arguments]    ${first_name}    ${last_name}    ${postal_code}
    Wait Until Element Is Visible    ${BtnCheckout}    10s
    Click Element    ${BtnCheckout}
    Wait Until Element Is Visible    ${InputFirstName}    10s
    Input Text    ${InputFirstName}    ${first_name}
    Input Text    ${InputLastName}    ${last_name}
    Input Text    ${InputPostalCode}    ${postal_code}
    Click Element    ${BtnContinue}

Validate checkout item total
    [Arguments]    ${expected_total}
    Wait Until Element Is Visible    ${LblItemTotal}    10s
    Element Should Contain    ${LblItemTotal}    ${expected_total}

Finish checkout
    Wait Until Element Is Visible    ${BtnFinish}    10s
    Click Element    ${BtnFinish}

Validate checkout complete
    Wait Until Element Is Visible    ${CheckoutCompleteHeader}    10s
    Element Should Contain    ${CheckoutCompleteHeader}    Thank you for your order!

Sort products by option value
    [Arguments]    ${sort_value}
    Wait Until Element Is Visible    ${SelectSortProducts}    10s
    Select From List By Value    ${SelectSortProducts}    ${sort_value}

Get first inventory item name
    Wait Until Element Is Visible    ${InventoryItemName}    10s
    ${first_item}=    Get Text    ${InventoryItemName}
    RETURN    ${first_item}
    