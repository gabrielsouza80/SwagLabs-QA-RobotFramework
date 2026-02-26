*** Settings ***
Resource    ../../Base.resource

*** Variables ***
# Header / common
${CheckoutCartLink}                                      css:a.shopping_cart_link
${CheckoutTitle}                                         css:span.title

# Inventory (pre-checkout actions)
${CheckoutAddBackpack}                                   css:button[id="add-to-cart-sauce-labs-backpack"]
${CheckoutAddBikeLight}                                  css:button[id="add-to-cart-sauce-labs-bike-light"]
${CheckoutCartBadge}                                     css:span.shopping_cart_badge

# Cart page
${CartList}                                              css:div.cart_list
${CartItemName}                                          css:div.cart_item .inventory_item_name
${CartContinueShoppingButton}                            css:button[id="continue-shopping"]
${CartCheckoutButton}                                    css:button[id="checkout"]

# Checkout: Your Information
${CheckoutInfoContainer}                                 css:div.checkout_info_container
${CheckoutFirstName}                                     css:input[id="first-name"]
${CheckoutLastName}                                      css:input[id="last-name"]
${CheckoutPostalCode}                                    css:input[id="postal-code"]
${CheckoutContinueButton}                                css:input[id="continue"]
${CheckoutCancelButton}                                  css:button[id="cancel"]

# Checkout: Overview
${CheckoutSummaryContainer}                              css:div.checkout_summary_container
${CheckoutItemTotal}                                     css:div.summary_subtotal_label
${CheckoutTax}                                           css:div.summary_tax_label
${CheckoutTotal}                                         css:div.summary_total_label
${CheckoutFinishButton}                                  css:button[id="finish"]

# Checkout: Complete
${CheckoutCompleteContainer}                             css:div.checkout_complete_container
${CheckoutCompleteHeader}                                css:h2.complete-header
${CheckoutCompleteText}                                  css:div.complete-text
${CheckoutBackHomeButton}                                css:button[id="back-to-products"]
