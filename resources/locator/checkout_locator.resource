*** Settings ***
Documentation       This resource file defines reusable locator variables for desktop web keywords.


*** Variables ***
&{CHECKOUT}
...                     txt_firstname=id=first-name
...                     txt_lastname=id=last-name
...                     txt_zipcode=id=postal-code
...                     btn_continue=id=continue
...                     lbl_card=xpath=//div[@class='summary_value_label'][1]
...                     lbl_shipping=xpath=//div[@class='summary_value_label'][2]
...                     lbl_subtotal=xpath=//div[@class='summary_subtotal_label']
...                     lbl_tax=xpath=//div[@class='summary_tax_label']
...                     lbl_total=xpath=//div[@class='summary_info_label summary_total_label']
...                     btn_finish=id=finish
...                     btn_cancel=id=cancel

&{CHECKOUT_FINISH}
...                     lbl_complete=xpath=//div[@class='header_secondary_container']/span
...                     lbl_thanks=xpath=//div[@class='checkout_complete_container']/h2
...                     lbl_desc=xpath=//div[@class='complete-text']
...                     btn_back=id=back-to-products

&{CHECKOUT_ERROR}
...                     lbl_error=xpath=//h3[@data-test='error']
