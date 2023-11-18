*** Settings ***
Documentation       This resource file defines reusable locator variables for desktop web keywords.


*** Variables ***
&{ALL_PRODUCT}
...                     lbl_page_head_title=xpath=//div[@class='header_label']/div
...                     lbl_product_head_title=xpath=//span[@class='title']
...                     btn_cart=id=shopping_cart_container
...                     lbl_cart_badge=xpath=//span[@class='shopping_cart_badge']
...                     lbl_cart_badge_count=xpath=//span[@class='shopping_cart_badge'][text()='2']
...                     btn_filter=xpath=//select[@class='product_sort_container']
...                     lbl_filter=xpath=//span[@class='active_option']
...                     ddl_A_Z=xpath=//select[@class='product_sort_container']/option[@value='az']
...                     ddl_Z_A=xpath=//select[@class='product_sort_container']/option[@value='za']
...                     ddl_low_high=xpath=//select[@class='product_sort_container']/option[@value='lohi']
...                     ddl_high_low=xpath=//select[@class='product_sort_container']/option[@value='hilo']
...                     lbl_menu=id=react-burger-menu-btn

&{PRODUCT_DETAIL}
...                     lbl_product_list=xpath=//div[@class='inventory_item']
...                     lbl_product_img=xpath=//div[@class='inventory_item'][number_of_product]//a/img
...                     lbl_product_name=xpath=//div[@class='inventory_item'][number_of_product]/div[2]/div/a/div
...                     lbl_product_desc=xpath=//div[@class='inventory_item'][number_of_product]//div[@class='inventory_item_desc']
...                     lbl_product_price=xpath=//div[@class='inventory_item'][number_of_product]//div[@class='inventory_item_price']
...                     lbl_button=xpath=//div[@class='inventory_item'][number_of_product]//button
