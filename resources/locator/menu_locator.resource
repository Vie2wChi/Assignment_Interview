*** Settings ***
Documentation       This resource file defines reusable locator variables for desktop web keywords.


*** Variables ***
&{MENU_PAGE}
...             lbl_menu_bar=//div[@class='bm-menu-wrap']
...             lbl_all_items=id=inventory_sidebar_link
...             lbl_about=id=about_sidebar_link
...             lbl_logout=id=logout_sidebar_link
...             lbl_reset=id=reset_sidebar_link
...             lbl_close=id=react-burger-cross-btn
