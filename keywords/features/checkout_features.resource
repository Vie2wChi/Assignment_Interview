*** Settings ***
Documentation       This resource file defines reusable desktop web keywords for test cases functionality.


*** Keywords ***
Checkout input and confirm information
    [Arguments]    ${firstname}    ${lastname}    ${zipcode}
    checkout_page.Input fistname    ${firstname}
    checkout_page.Input lastname    ${lastname}
    checkout_page.Input zipcode    ${zipcode}
    common_keywords.Click visible element    ${CHECKOUT.btn_continue}

Verify checkout information
    [Arguments]    ${expect_card}    ${expect_shipping}    ${expect_subtotal}    ${expect_tax}    ${expect_total}
    common_keywords.Verify text    ${CHECKOUT.lbl_card}    ${expect_card}
    common_keywords.Verify text    ${CHECKOUT.lbl_shipping}    ${expect_shipping}
    common_keywords.Verify text    ${CHECKOUT.lbl_subtotal}    ${expect_subtotal}
    common_keywords.Verify text    ${CHECKOUT.lbl_tax}    ${expect_tax}
    common_keywords.Verify text    ${CHECKOUT.lbl_total}    ${expect_total}

Verify checkout completed
    [Arguments]    ${expect_complete}    ${expect_thanks}    ${expect_desc}
    common_keywords.Verify text    ${CHECKOUT_FINISH.lbl_complete}    ${expect_complete}
    common_keywords.Verify text    ${CHECKOUT_FINISH.lbl_thanks}    ${expect_thanks}
    common_keywords.Verify text    ${CHECKOUT_FINISH.lbl_desc}    ${expect_desc}

Redirect to checkout information page
    allproduct_page.Click add to cart
    common_keywords.Scroll to Click visible element    ${ALL_PRODUCT.btn_cart}
    cart_page.Get products detail and verify product detail
    common_keywords.Scroll to Click visible element    ${PRODUCT_DETAIL_CART.btn_checkout}
