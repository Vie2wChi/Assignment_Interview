*** Settings ***
Documentation       This resource file defines reusable desktop web keywords for test cases functionality.


*** Keywords ***
Get products detail and verify default state
    ${count_product}    SeleniumLibrary.Get Element Count    ${PRODUCT_DETAIL.lbl_product_list}
    ${product_img_list}    Create List
    ${product_name_list}    Create List
    ${product_desc_list}    Create List
    ${product_price_list}    Create List
    ${product_button_list}    Create List
    FOR    ${li}    IN RANGE    1    ${count_product}+1
# Img list
        ${li_string}    BuiltIn.Convert to string    ${li}
        ${replace_product_img_xpath}    String.Replace string
        ...    ${PRODUCT_DETAIL.lbl_product_img}
        ...    number_of_product
        ...    ${li_string}
        ${product_img}    BuiltIn.Replace Variables    ${replace_product_img_xpath}
        ${element_product}    SeleniumLibrary.Get Element Attribute    ${product_img}    attribute=src
        Collections.Append To List    ${product_img_list}    ${element_product}
# Title list
        ${replace_product_name_xpath}    String.Replace string
        ...    ${PRODUCT_DETAIL.lbl_product_name}
        ...    number_of_product
        ...    ${li_string}
        ${product_name}    BuiltIn.Replace Variables    ${replace_product_name_xpath}
        ${product_name_text}    SeleniumLibrary.Get Text    ${product_name}
        Collections.Append To List    ${product_name_list}    ${product_name_text}
# Description list
        ${replace_product_desc_xpath}    String.Replace string
        ...    ${PRODUCT_DETAIL.lbl_product_desc}
        ...    number_of_product
        ...    ${li_string}
        ${product_desc}    BuiltIn.Replace Variables    ${replace_product_desc_xpath}
        ${product_desc_text}    SeleniumLibrary.Get Text    ${product_desc}
        Collections.Append To List    ${product_desc_list}    ${product_desc_text}
# Price list
        ${replace_product_price_xpath}    String.Replace string
        ...    ${PRODUCT_DETAIL.lbl_product_price}
        ...    number_of_product
        ...    ${li_string}
        ${product_price}    BuiltIn.Replace Variables    ${replace_product_price_xpath}
        ${product_price_text}    SeleniumLibrary.Get Text    ${product_price}
        Collections.Append To List    ${product_price_list}    ${product_price_text}
# Button list
        ${replace_product_button_xpath}    String.Replace string
        ...    ${PRODUCT_DETAIL.lbl_button}
        ...    number_of_product
        ...    ${li_string}
        ${product_button}    BuiltIn.Replace Variables    ${replace_product_button_xpath}
        ${product_button_text}    SeleniumLibrary.Get Text    ${product_button}
        Collections.Append To List    ${product_button_list}    ${product_button_text}
    END
    BuiltIn.Should Be Equal
    ...    ${product_img_list}
    ...    ${expected_product_img}
    ...    msg=Product image displayed incorrect at default state
    BuiltIn.Should Be Equal
    ...    ${product_name_list}
    ...    ${expected_product_name}
    ...    msg=Product name displayed incorrect at default state
    BuiltIn.Should Be Equal
    ...    ${product_desc_list}
    ...    ${expected_product_desc}
    ...    msg=Product desc displayed incorrect at default state
    BuiltIn.Should Be Equal
    ...    ${product_price_list}
    ...    ${expected_product_price}
    ...    msg=Product price displayed incorrect at default state
    BuiltIn.Should Be Equal
    ...    ${product_button_list}
    ...    ${default_product_button}
    ...    msg=Product button displayed incorrect at default state

Click add to cart
    ${count_product}    SeleniumLibrary.Get Element Count    ${PRODUCT_DETAIL.lbl_product_list}
    ${product_button_list}    Create List
    FOR    ${li}    IN RANGE    1    ${count_product}+1
        ${li_string}    BuiltIn.Convert to string    ${li}
        ${replace_product_button_xpath}    String.Replace string
        ...    ${PRODUCT_DETAIL.lbl_button}
        ...    number_of_product
        ...    ${li_string}
        ${product_button}    BuiltIn.Replace Variables    ${replace_product_button_xpath}
        SeleniumLibrary.Click button    ${product_button}
    END
