*** Settings ***
Resource    ../../Base.resource

*** Variables ***
${BtnOpenMenu}                                         //button[normalize-space()='Open Menu']
${ABtnLogout}                                          css:#logout_sidebar_link
${titleInventory}                                      css:span.title
${BtnAddBackpack}                                      css:button[id="add-to-cart-sauce-labs-backpack"]
${BtnAddBikeLight}                                     css:button[id="add-to-cart-sauce-labs-bike-light"]
${BtnRemoveBackpack}                                   css:button[id="remove-sauce-labs-backpack"]
${CartLink}                                            css:a.shopping_cart_link
${CartBadge}                                           css:span.shopping_cart_badge
${CartItemName}                                        css:div.cart_item .inventory_item_name
${BtnCheckout}                                         css:button[id="checkout"]

${InputFirstName}                                      css:input[id="first-name"]
${InputLastName}                                       css:input[id="last-name"]
${InputPostalCode}                                     css:input[id="postal-code"]
${BtnContinue}                                         css:input[id="continue"]
${LblItemTotal}                                        css:div.summary_subtotal_label
${BtnFinish}                                           css:button[id="finish"]
${CheckoutCompleteHeader}                              css:h2.complete-header
${BtnBackToProducts}                                   css:button[id="back-to-products"]

${SelectSortProducts}                                  css:select.product_sort_container
${InventoryItemName}                                   css:div.inventory_item_name
