*** Settings ***
Resource            ${CURDIR}/../../resources/imports/imports.resource

Test Setup          common_keywords.Open and login to qa-challenge success
...                     ${username.standard_user}    ${password.valid_password}
Test Teardown       SeleniumLibrary.Close All Browsers


*** Test Cases ***
TC_001 Verify selected product at cart page
    [Tags]    functional
    cart_features.Select product and redirect to cart page
    cart_page.Get products detail and verify product detail

TC_002 Verify navigate to all productpage when click continue shopping
    [Tags]    functional
    cart_features.Select product and redirect to cart page
    common_keywords.Click visible element    ${PRODUCT_DETAIL_CART.btn_continue_shop}
    common_keywords.Verify text    ${ALL_PRODUCT.lbl_product_head_title}    ${title_name}
