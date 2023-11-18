*** Settings ***
Documentation       This resource file defines reusable locator variables for desktop web keywords.


*** Variables ***
&{LOGIN_PAGE}
...                 txt_username=id=user-name
...                 txt_password=id=password
...                 btn_login=id=login-button
...                 lbl_error=xpath=//h3[@data-test='error']
