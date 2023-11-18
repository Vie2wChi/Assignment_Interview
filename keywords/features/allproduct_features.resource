*** Settings ***
Documentation       This resource file defines reusable desktop web keywords for test cases functionality.


*** Keywords ***
Login Page
    [Arguments]    ${username}    ${password}
    login_page.Input username    ${username}
    login_page.Input password    ${password}
    login_page.Click login button

Verify allproduct page default state
    common_keywords.Verify text    ${ALL_PRODUCT.lbl_page_head_title}    ${head_title_name}
    common_keywords.Verify text    ${ALL_PRODUCT.lbl_product_head_title}    ${title_name}
    common_keywords.Verify text    ${ALL_PRODUCT.lbl_filter}    ${selected_filter.A_Z}
    SeleniumLibrary.Element Should Not Be Visible    ${ALL_PRODUCT.lbl_cart_badge}
    SeleniumLibrary.Element Should Be Visible    ${ALL_PRODUCT.lbl_menu}
    allproduct_page.Get products detail and verify default state

Get product detail by list
    [Documentation]    ${product_detail_locator} is locator of product detail
    ...    ${expected_product_detail} is expected of product detail e.g. product name, detail, price
    [Arguments]    ${product_detail_locator}
    ${count_product}    SeleniumLibrary.Get Element Count    ${PRODUCT_DETAIL.lbl_product_list}
    ${product_list}    Create List
    FOR    ${li}    IN RANGE    1    ${count_product}+1
        ${li_string}    BuiltIn.Convert to string    ${li}
        ${replace_xpath}    String.Replace string
        ...    ${product_detail_locator}
        ...    number_of_product
        ...    ${li_string}
        ${product_locator}    BuiltIn.Replace Variables    ${replace_xpath}
        ${product_locator_text}    SeleniumLibrary.Get Text    ${product_locator}
        Collections.Append To List    ${product_list}    ${product_locator_text}
    END
    BuiltIn.Set Global Variable    ${gl_product_list}    ${product_list}

Sort expected product detail by list DESC
    [Documentation]    product detail sorting list by DESC
    ...    ${expected_product_detail} is expected of product detail e.g. product name, detail, price
    [Arguments]    ${expected_product_detail}
    Collections.Sort list    ${expected_product_detail}
    BuiltIn.Set Global Variable    ${expected_product_detail}    ${expected_product_detail}[::-1]
    BuiltIn.Should Be Equal
    ...    ${gl_product_list}
    ...    ${expected_product_detail}
    ...    msg=Product name displayed incorrect at default state
