*** Settings ***
Documentation       This resource file defines reusable desktop web keywords for test cases functionality.


*** Keywords ***
Select product and redirect to cart page
    allproduct_page.Click add to cart
    common_keywords.Scroll to Click visible element    ${ALL_PRODUCT.btn_cart}
