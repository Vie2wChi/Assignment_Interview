*** Settings ***
Documentation       This resource file defines reusable desktop web keywords for test cases functionality.


*** Keywords ***
Input username
    [Arguments]    ${username}
    SeleniumLibrary.Input Text    ${LOGIN_PAGE.txt_username}    ${username}

Input password
    [Arguments]    ${password}
    SeleniumLibrary.Input Text    ${LOGIN_PAGE.txt_password}    ${password}
