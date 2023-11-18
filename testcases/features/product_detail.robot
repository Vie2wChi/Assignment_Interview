*** Settings ***
Resource            ${CURDIR}/../../resources/imports/imports.resource

Test Setup          common_keywords.Open and login to qa-challenge success
...                     ${username.standard_user}    ${password.valid_password}
Test Teardown       SeleniumLibrary.Close All Browsers


*** Variables ***
${first_index}      1


*** Test Cases ***
TC_001 Verify Back to Products button will navigated to All products page
    [Tags]    functional
    ${replace_product_xpath}    String.Replace string
    ...    ${PRODUCT_DETAIL.lbl_product_name}
    ...    number_of_product
    ...    ${first_index}
    common_keywords.Click visible element    ${replace_product_xpath}
    common_keywords.Click visible element    ${PRODUCT_LIST.btn_back}
    allproduct_features.Verify allproduct page default state

TC_002 User can toggle button from add to cart/Remove and verify cart badge
    [Tags]    functional
    ${replace_product_xpath}    String.Replace string
    ...    ${PRODUCT_DETAIL.lbl_product_name}
    ...    number_of_product
    ...    ${first_index}
    common_keywords.Click visible element    ${replace_product_xpath}
    common_keywords.Click visible element    ${Product_LIST.btn_add_button}
    common_keywords.Verify text    ${ALL_PRODUCT.lbl_cart_badge}    1
    common_keywords.Click visible element    ${Product_LIST.btn_remove_button}
    SeleniumLibrary.Element Should Not Be Visible    ${ALL_PRODUCT.lbl_cart_badge}
