*** Settings ***
Documentation       This resource file defines reusable desktop web keywords for test cases functionality.


*** Keywords ***
Login Page
    [Arguments]    ${username}    ${password}
    login_page.Input username    ${username}
    login_page.Input password    ${password}
    common_keywords.Click visible element    ${LOGIN_PAGE.btn_login}
