*** Settings ***
Resource            ${CURDIR}/../../resources/imports/imports.resource

Test Setup          common_keywords.Open and login to qa-challenge success
...                     ${username.standard_user}    ${password.valid_password}
Test Teardown       SeleniumLibrary.Close All Browsers


*** Test Cases ***
TC_001 Verify product name by filter Z-A
    [Tags]    functional
    common_keywords.Click visible element    ${ALL_PRODUCT.ddl_Z_A}
    allproduct_features.Get product detail by list    product_detail_locator=${PRODUCT_DETAIL.lbl_product_name}
    allproduct_features.Sort expected product detail by list DESC    expected_product_detail=${expected_product_name}

TC_002 Verify product price by filter low to high
    [Tags]    functional
    common_keywords.Click visible element    ${ALL_PRODUCT.ddl_low_high}
    allproduct_features.Get product detail by list    product_detail_locator=${PRODUCT_DETAIL.lbl_product_price}
    BuiltIn.Should Be Equal
    ...    ${gl_product_list}
    ...    ${expected_product_price_l_h}
    ...    msg=Product name displayed incorrect at default state

TC_003 Verify product price by filter high to low
    [Tags]    functional
    common_keywords.Click visible element    ${ALL_PRODUCT.ddl_high_low}
    allproduct_features.Get product detail by list    product_detail_locator=${PRODUCT_DETAIL.lbl_product_price}
    BuiltIn.Should Be Equal
    ...    ${gl_product_list}
    ...    ${expected_product_price_h_l}
    ...    msg=Product name displayed incorrect at default state
