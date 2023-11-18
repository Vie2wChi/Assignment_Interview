*** Settings ***
Documentation       This resource file defines reusable locator variables for desktop web keywords.


*** Variables ***
&{PRODUCT_DETAIL_CART}
...                         lbl_product_list=xpath=//div[@class='cart_item']
...                         lbl_product_name=xpath=//div[@class='cart_item'][number_of_product]//div[@class='inventory_item_name']
...                         lbl_product_desc=xpath=//div[@class='cart_item'][number_of_product]//div[@class='inventory_item_desc']
...                         lbl_product_price=xpath=//div[@class='cart_item'][number_of_product]//div[@class='inventory_item_price']
...                         lbl_button=xpath=//div[@class='cart_item'][number_of_product]//button
...                         btn_checkout=id=checkout
...                         lbl_title=xpath=//div[@class='header_secondary_container']/span
...                         btn_continue_shop=id=continue-shopping
