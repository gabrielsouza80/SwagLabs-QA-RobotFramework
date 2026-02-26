*** Settings ***
Resource    ../../Base.resource

*** Keywords ***
Prepare cart with two default items
    [Arguments]    ${role}=standard
    Login with credentials    ${role}
    Check if you went to the expected page    ${titleInventory}
    Wait Until Element Is Visible    ${CheckoutAddBackpack}    10s
    Click Element    ${CheckoutAddBackpack}
    Click Element    ${CheckoutAddBikeLight}

Open cart page
    Click Element    ${CheckoutCartLink}
    Wait Until Element Is Visible    ${CartList}    10s

Validate cart page loaded
    [Arguments]    ${expected_title}
    Element Text Should Be    ${CheckoutTitle}    ${expected_title}

Validate cart contains expected items
    [Arguments]    @{expected_items}
    FOR    ${item}    IN    @{expected_items}
        Page Should Contain    ${item}
    END

Start checkout information step
    [Arguments]    ${expected_title}
    Wait Until Element Is Visible    ${CartCheckoutButton}    10s
    Click Element    ${CartCheckoutButton}
    Wait Until Element Is Visible    ${CheckoutInfoContainer}    10s
    Element Text Should Be    ${CheckoutTitle}    ${expected_title}

Fill checkout information
    [Arguments]    ${first_name}    ${last_name}    ${postal_code}
    Input Text    ${CheckoutFirstName}    ${first_name}
    Input Text    ${CheckoutLastName}    ${last_name}
    Input Text    ${CheckoutPostalCode}    ${postal_code}
    Click Element    ${CheckoutContinueButton}

Validate checkout overview loaded
    [Arguments]    ${expected_title}
    Wait Until Element Is Visible    ${CheckoutSummaryContainer}    10s
    Element Text Should Be    ${CheckoutTitle}    ${expected_title}

Validate checkout totals
    [Arguments]    ${expected_item_total}    ${expected_tax}    ${expected_total}
    Element Should Contain    ${CheckoutItemTotal}    ${expected_item_total}
    Element Should Contain    ${CheckoutTax}    ${expected_tax}
    Element Should Contain    ${CheckoutTotal}    ${expected_total}

Finish checkout flow
    Click Element    ${CheckoutFinishButton}
    Wait Until Element Is Visible    ${CheckoutCompleteContainer}    10s

Validate checkout complete page
    [Arguments]    ${expected_title}    ${expected_header}    ${expected_text_contains}
    Element Text Should Be    ${CheckoutTitle}    ${expected_title}
    Element Should Contain    ${CheckoutCompleteHeader}    ${expected_header}
    Element Should Contain    ${CheckoutCompleteText}    ${expected_text_contains}

Go back to products from complete page
    Click Element    ${CheckoutBackHomeButton}
    Wait Until Element Is Visible    ${titleInventory}    10s
