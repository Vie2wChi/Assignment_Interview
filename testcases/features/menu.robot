*** Settings ***
Resource            ${CURDIR}/../../resources/imports/imports.resource

Test Setup          common_keywords.Open and login to qa-challenge success
...                     ${username.standard_user}    ${password.valid_password}
Test Teardown       SeleniumLibrary.Close All Browsers


*** Variables ***
${first_index}      1


*** Test Cases ***
TC_001 verify back to default page correcty when click on first product then click all items
    [Tags]    functional
    common_keywords.Click visible element    ${ALL_PRODUCT.ddl_Z_A}
    ${replace_product_xpath}    String.Replace string
    ...    ${PRODUCT_DETAIL.lbl_product_name}
    ...    number_of_product
    ...    ${first_index}
    common_keywords.Click visible element    ${replace_product_xpath}
    menu_features.Click menu list    ${MENU_PAGE.lbl_all_items}
    allproduct_features.Verify allproduct page default state

TC_002 verify back to default page correcty when click on cart icon then click all items
    [Tags]    functional
    common_keywords.Click visible element    ${ALL_PRODUCT.ddl_Z_A}
    common_keywords.Click visible element    ${ALL_PRODUCT.btn_cart}
    menu_features.Click menu list    ${MENU_PAGE.lbl_all_items}
    allproduct_features.Verify allproduct page default state

TC_003 verify navication to saucelabs after user click menu about
    [Tags]    functional
    menu_features.Click menu list    ${MENU_PAGE.lbl_about}
    SeleniumLibrary.Location Should Be    url=${about.location}

TC_004 verify navication to login page after user click menu logout
    [Tags]    functional
    menu_features.Click menu list    ${MENU_PAGE.lbl_logout}
    SeleniumLibrary.Location Should Be    url=${HOST_URL}

TC_005 verify reset app state
    [Tags]    functional
    ${replace_button_xpath}    String.Replace string
    ...    ${PRODUCT_DETAIL.lbl_button}
    ...    number_of_product
    ...    ${first_index}
    common_keywords.Click visible element    ${replace_button_xpath}
    menu_features.Click menu list    ${MENU_PAGE.lbl_reset}
    SeleniumLibrary.Reload Page
    allproduct_features.Verify allproduct page default state

TC_006 verify close menu page
    [Tags]    functional
    menu_features.Click menu list    ${MENU_PAGE.lbl_close}
    SeleniumLibrary.Wait Until Element Is Not Visible    ${MENU_PAGE.lbl_menu_bar}
