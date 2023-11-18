*** Settings ***
Documentation       This resource file defines reusable desktop web keywords for test cases functionality.


*** Keywords ***
Get products detail and verify product detail
    ${count_product}    SeleniumLibrary.Get Element Count    ${PRODUCT_DETAIL_CART.lbl_product_list}
    ${product_name_list}    Create List
    ${product_desc_list}    Create List
    ${product_price_list}    Create List
    ${product_button_list}    Create List
    FOR    ${li}    IN RANGE    1    ${count_product}+1
        ${li_string}    BuiltIn.Convert to string    ${li}
# Title list
        ${replace_product_name_xpath}    String.Replace string
        ...    ${PRODUCT_DETAIL_CART.lbl_product_name}
        ...    number_of_product
        ...    ${li_string}
        ${product_name}    BuiltIn.Replace Variables    ${replace_product_name_xpath}
        ${product_name_text}    SeleniumLibrary.Get Text    ${product_name}
        Collections.Append To List    ${product_name_list}    ${product_name_text}
# Description list
        ${replace_product_desc_xpath}    String.Replace string
        ...    ${PRODUCT_DETAIL_CART.lbl_product_desc}
        ...    number_of_product
        ...    ${li_string}
        ${product_desc}    BuiltIn.Replace Variables    ${replace_product_desc_xpath}
        ${product_desc_text}    SeleniumLibrary.Get Text    ${product_desc}
        Collections.Append To List    ${product_desc_list}    ${product_desc_text}
# Price list
        ${replace_product_price_xpath}    String.Replace string
        ...    ${PRODUCT_DETAIL_CART.lbl_product_price}
        ...    number_of_product
        ...    ${li_string}
        ${product_price}    BuiltIn.Replace Variables    ${replace_product_price_xpath}
        ${product_price_text}    SeleniumLibrary.Get Text    ${product_price}
        Collections.Append To List    ${product_price_list}    ${product_price_text}
# Button list
        ${replace_product_button_xpath}    String.Replace string
        ...    ${PRODUCT_DETAIL_CART.lbl_button}
        ...    number_of_product
        ...    ${li_string}
        ${product_button}    BuiltIn.Replace Variables    ${replace_product_button_xpath}
        ${product_button_text}    SeleniumLibrary.Get Text    ${product_button}
        Collections.Append To List    ${product_button_list}    ${product_button_text}
    END
    BuiltIn.Should Be Equal
    ...    ${product_name_list}
    ...    ${expected_product_name}
    ...    msg=Product name displayed incorrect at cart page
    BuiltIn.Should Be Equal
    ...    ${product_desc_list}
    ...    ${expected_product_desc}
    ...    msg=Product desc displayed incorrect at cart page
    BuiltIn.Should Be Equal
    ...    ${product_price_list}
    ...    ${expected_product_price}
    ...    msg=Product price displayed incorrect at cart page
    BuiltIn.Should Be Equal
    ...    ${product_button_list}
    ...    ${remove_product_button}
    ...    msg=Product button displayed incorrect at cart page
