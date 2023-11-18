*** Settings ***
Resource            ${CURDIR}/../../resources/imports/imports.resource

Test Setup          common_keywords.Open and login to qa-challenge success
...                     ${username.standard_user}    ${password.valid_password}
Test Teardown       SeleniumLibrary.Close All Browsers


*** Test Cases ***
TC_001 Verify error validation when user not input first name, last name and Zip code then confirm information
    [Tags]    functional
    checkout_features.Redirect to checkout information page
    common_keywords.Click visible element    ${CHECKOUT.btn_continue}
    common_keywords.Verify error validation    ${error_checkout_info.require_firstname}    ${CHECKOUT_ERROR.lbl_error}

TC_002 Verify error validation when user input only first name then confirm information
    [Tags]    functional
    checkout_features.Redirect to checkout information page
    checkout_page.Input fistname    ${firstname}
    common_keywords.Click visible element    ${CHECKOUT.btn_continue}
    common_keywords.Verify error validation    ${error_checkout_info.require_lastname}    ${CHECKOUT_ERROR.lbl_error}

TC_003 Verify error validation when user input only last name then confirm information
    [Tags]    functional
    checkout_features.Redirect to checkout information page
    checkout_page.Input lastname    ${lastname}
    common_keywords.Click visible element    ${CHECKOUT.btn_continue}
    common_keywords.Verify error validation    ${error_checkout_info.require_firstname}    ${CHECKOUT_ERROR.lbl_error}

TC_004 Verify error validation when user input only firstname and last name then confirm information
    [Tags]    functional
    checkout_features.Redirect to checkout information page
    checkout_page.Input fistname    ${firstname}
    checkout_page.Input lastname    ${lastname}
    common_keywords.Click visible element    ${CHECKOUT.btn_continue}
    common_keywords.Verify error validation    ${error_checkout_info.require_zipcode}    ${CHECKOUT_ERROR.lbl_error}

TC_005 Verify navigate to cart page when click cancel button
    [Tags]    functional
    checkout_features.Redirect to checkout information page
    common_keywords.Click visible element    ${CHECKOUT.btn_cancel}
    common_keywords.Verify text    ${PRODUCT_DETAIL_CART.lbl_title}    ${cart_detail.title}

TC_006 checkout complete, select Back Home page will redirected to all product page
    [Tags]    functional    e2e
    checkout_features.Redirect to checkout information page
    checkout_features.Checkout input and confirm information    ${firstname}    ${lastname}    ${zipcode}
    checkout_page.Get products detail and verify product detail on checkout overview page
    checkout_features.Verify checkout information
    ...    ${checkout_info.Payment}
    ...    ${checkout_info.Shipping}
    ...    ${checkout_info.Item_total}
    ...    ${checkout_info.Tax}
    ...    ${checkout_info.Total}
    common_keywords.Scroll to Click visible element    ${CHECKOUT.btn_finish}
    checkout_features.Verify checkout completed
    ...    ${checkout_complete.complete}
    ...    ${checkout_complete.thanks}
    ...    ${checkout_complete.desc}
    common_keywords.Scroll to Click visible element    ${CHECKOUT_FINISH.btn_back}
    allproduct_features.Verify allproduct page default state
