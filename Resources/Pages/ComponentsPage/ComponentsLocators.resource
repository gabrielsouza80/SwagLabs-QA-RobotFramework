*** Settings ***
Resource    ../../Base.resource

*** Variables ***
${ComponentAppLogo}                                   css:div.app_logo
${ComponentCartLink}                                  css:a.shopping_cart_link
${ComponentMenuButton}                                css:button[id="react-burger-menu-btn"]
${ComponentMenuCloseButton}                           css:button[id="react-burger-cross-btn"]
${ComponentMenuContainer}                             css:div.bm-menu
${ComponentMenuItemList}                              css:nav.bm-item-list
${ComponentMenuInventoryLink}                         css:a[id="inventory_sidebar_link"]
${ComponentMenuAboutLink}                             css:a[id="about_sidebar_link"]
${ComponentMenuLogoutLink}                            css:a[id="logout_sidebar_link"]
${ComponentMenuResetLink}                             css:a[id="reset_sidebar_link"]
${ComponentProductsTitle}                             css:span.title
${ComponentFooterCopy}                                css:div.footer_copy
