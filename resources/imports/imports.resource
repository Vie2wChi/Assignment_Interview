*** Settings ***
Documentation       Import this file to test suits file for access library, keywords and test data.

Library             String
Library             Collections
Library             SeleniumLibrary    timeout=60s    implicit_wait=10s
########## Page Keywords ##########
Resource            ${CURDIR}/../../keywords/common/common_keywords.resource
Resource            ${CURDIR}/../../keywords/page/login_page.resource
Resource            ${CURDIR}/../../keywords/page/allproduct_page.resource
Resource            ${CURDIR}/../../keywords/page/menu_page.resource
Resource            ${CURDIR}/../../keywords/page/cart_page.resource
Resource            ${CURDIR}/../../keywords/page/checkout_page.resource
########## Features Keywords ##########
Resource            ${CURDIR}/../../keywords/features/login_features.resource
Resource            ${CURDIR}/../../keywords/features/allproduct_features.resource
Resource            ${CURDIR}/../../keywords/features/menu_features.resource
Resource            ${CURDIR}/../../keywords/features/checkout_features.resource
Resource            ${CURDIR}/../../keywords/features/cart_features.resource
########## Test data ##########
Variables           ${CURDIR}/../testdata/login_page.yaml
Variables           ${CURDIR}/../testdata/checkout_page.yaml
########## Locator ##########
Resource            ${CURDIR}/../locator/login_locator.resource
Resource            ${CURDIR}/../locator/allproduct_locator.resource
Resource            ${CURDIR}/../locator/menu_locator.resource
Resource            ${CURDIR}/../locator/cart_locator.resource
Resource            ${CURDIR}/../locator/checkout_locator.resource
Resource            ${CURDIR}/../locator/product_list_locator.resource
########## Translation ##########
Variables           ${CURDIR}/../translation/translation_allproduct_page.yaml
Variables           ${CURDIR}/../translation/translation_login_page.yaml
Variables           ${CURDIR}/../translation/translation_menu_page.yaml
Variables           ${CURDIR}/../translation/translation_checkout_page.yaml
Variables           ${CURDIR}/../translation/translation_cart_page.yaml
########## Environment ##########
Variables           ${CURDIR}/../environment/env_config.yaml
