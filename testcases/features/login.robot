*** Settings ***
Resource            ${CURDIR}/../../resources/imports/imports.resource

Test Setup          common_keywords.Open browser and set window size
Test Teardown       SeleniumLibrary.Close All Browsers


*** Test Cases ***
TC_001 Verify Login page success and site should work with default all product state
    [Tags]    functional
    login_features.Login Page    ${username.standard_user}    ${password.valid_password}
    allproduct_features.Verify allproduct page default state

TC_002 Verify Login Page with locked out user then should displayed locked out validation
    [Tags]    functional
    login_features.Login Page    ${username.locked_out_user}    ${password.valid_password}
    common_keywords.Verify error validation    ${error.locked_out}    ${LOGIN_PAGE.lbl_error}

TC_003 Verify Login with account that load incorrect image, this case will be FAIL and Throw error msg
    [Tags]    functional
    login_features.Login Page    ${username.problem_user}    ${password.valid_password}
    allproduct_features.Verify allproduct page default state

TC_004 Verify Login page success and site should be work properly with performance_glitch_user issue
    [Tags]    functional
    login_features.Login Page    ${username.performance_glitch_user}    ${password.valid_password}
    allproduct_features.Verify allproduct page default state

TC_005 Verify error validation when user login then not input username and password
    [Tags]    functional
    common_keywords.Click visible element    ${LOGIN_PAGE.btn_login}
    common_keywords.Verify error validation    ${error.required_username}    ${LOGIN_PAGE.lbl_error}

TC_006 Verify error validation with user login then input only username
    [Tags]    functional
    login_page.Input username    ${username.standard_user}
    common_keywords.Click visible element    ${LOGIN_PAGE.btn_login}
    common_keywords.Verify error validation    ${error.required_password}    ${LOGIN_PAGE.lbl_error}

TC_007 Verify error validation with user login then input only password
    [Tags]    functional
    login_page.Input password    ${password.valid_password}
    common_keywords.Click visible element    ${LOGIN_PAGE.btn_login}
    common_keywords.Verify error validation    ${error.required_username}    ${LOGIN_PAGE.lbl_error}

TC_008 Verify error validation with user login then input invalid username
    [Tags]    functional
    login_features.Login Page    ${username.invalid_user}    ${password.valid_password}
    common_keywords.Verify error validation    ${error.username_invalid}    ${LOGIN_PAGE.lbl_error}

TC_009 Verify error validation with user login then input invalid password
    [Tags]    functional
    login_features.Login Page    ${username.standard_user}    ${password.invalid_password}
    common_keywords.Verify error validation    ${error.password_invalid}    ${LOGIN_PAGE.lbl_error}
