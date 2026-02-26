*** Settings ***
Resource    ../../Base.resource

*** Variables ***
${titleInventory}                                    css:span.title
${HomePageTitle}                                      css:span.title
${HomePageAppLogo}                                    css:div.app_logo
${HomePageSortSelect}                                 css:select.product_sort_container
${HomePageActiveSortOption}                           css:span.active_option
${HomePageInventoryList}                              css:div.inventory_list
${HomePageInventoryItem}                              css:div.inventory_item
${HomePageFooterCopy}                                 css:div.footer_copy
${HomePageTwitterLink}                                css:a[data-test="social-twitter"]
${HomePageFacebookLink}                               css:a[data-test="social-facebook"]
${HomePageLinkedinLink}                               css:a[data-test="social-linkedin"]
${HomePageMenuButton}                                 css:button[id="react-burger-menu-btn"]
${HomePageMenuCloseButton}                            css:button[id="react-burger-cross-btn"]
${HomePageMenuInventoryLink}                          css:a[id="inventory_sidebar_link"]
${HomePageMenuAboutLink}                              css:a[id="about_sidebar_link"]
${HomePageMenuLogoutLink}                             css:a[id="logout_sidebar_link"]
${HomePageMenuResetLink}                              css:a[id="reset_sidebar_link"]
${HomePageCartLink}                                   css:a.shopping_cart_link
${HomePageCartBadge}                                  css:span.shopping_cart_badge
${HomePageAddBackpack}                                css:button[id="add-to-cart-sauce-labs-backpack"]
${HomePageAddBikeLight}                               css:button[id="add-to-cart-sauce-labs-bike-light"]
