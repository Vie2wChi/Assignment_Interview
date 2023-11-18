*** Settings ***
Documentation       This resource file defines reusable desktop web keywords for test cases functionality.


*** Keywords ***
Click menu list
    [Arguments]    ${locator_menu}
    common_keywords.Click visible element    ${ALL_PRODUCT.lbl_menu}
    common_keywords.Click visible element    ${locator_menu}
