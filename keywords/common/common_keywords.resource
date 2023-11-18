*** Settings ***
Documentation       This resource file defines reusable desktop web keywords for test cases functionality.


*** Keywords ***
Open browser and set window size
    [Documentation]    Open browser and set window size
    SeleniumLibrary.Open Browser    url=${HOST_URL}    browser=${BROWSER}
    SeleniumLibrary.Set Window Size    width=${1920}    height=${1080}

Open and login to qa-challenge success
    [Documentation]    Open desktop browser and Login to qa-challenge
    [Arguments]    ${username}    ${password}
    SeleniumLibrary.Open Browser    url=${HOST_URL}    browser=${BROWSER}
    SeleniumLibrary.Set Window Size    width=${1920}    height=${1080}
    login_features.Login Page    ${username}    ${password}

Verify text
    [Documentation]    Verify text in element is visible
    [Arguments]    ${text_locator}    ${text_expect}
    SeleniumLibrary.Wait Until Element Is Visible    ${text_locator}
    SeleniumLibrary.Element Text Should Be    ${text_locator}    ${text_expect}

Verify error validation
    [Documentation]    Verify error validation
    [Arguments]    ${text_error}    ${locator_error}
    SeleniumLibrary.Wait Until Element Is Visible    ${locator_error}
    SeleniumLibrary.Element Text Should Be
    ...    ${locator_error}
    ...    ${text_error}
    ...    msg=Incorrect displayed error msg

Click visible element
    [Documentation]    Click when element is visible'
    [Arguments]    ${locator}    ${timeout}=30s
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    ${timeout}
    SeleniumLibrary.Click Element    ${locator}

Scroll to Click visible element
    [Documentation]    Click when element is visible'
    [Arguments]    ${locator}    ${timeout}=30s
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    ${timeout}
    SeleniumLibrary.Scroll element into view    ${locator}
    SeleniumLibrary.Click Element    ${locator}
