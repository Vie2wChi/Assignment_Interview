*** Settings ***
Documentation       This resource file defines reusable desktop web keywords for test cases functionality.


*** Keywords ***
verify product and sort product
    [Documentation]    ${sort_type} is asc or desc
    ...    ${product_detail_locator} is locator of product detail
    ...    ${expected_product_detail} is expected of product detail e.g. product name, detail, price
    [Arguments]    ${sort_type}    ${product_detail_locator}    ${expected_product_detail}
    ${count_product}    SeleniumLibrary.Get Element Count    ${PRODUCT_DETAIL.lbl_product_list}
    ${product_name_list}    Create List
    FOR    ${li}    IN RANGE    1    ${count_product}+1
        ${replace_xpath}    String.Replace string
        ...    ${product_detail_locator}
        ...    number_of_product
        ...    ${li_string}
        ${product_locator}    BuiltIn.Replace Variables    ${replace_xpath}
        ${product_locator_text}    SeleniumLibrary.Get Text    ${product_locator}
        Collections.Append To List    ${product_list}    ${product_locator_text}
    END
    @{sort_expect_list}    Collections.Sort list    ${expected_product_detail}    reverse=${sort_type}
    BuiltIn.Should Be Equal
    ...    ${product_list}
    ...    ${sort_expect_list}
    ...    msg=Product name displayed incorrect at default state
