*** Settings ***
Library    SeleniumLibrary
Library    String
Library    yaml

#Page
Resource    ${CURDIR}/common.robot
Resource    ${CURDIR}/pages/login_page.robot
Resource    ${CURDIR}/pages/product_page.robot
Resource    ${CURDIR}/pages/cart_page.robot
Resource    ${CURDIR}/pages/checkout_information_page.robot
Resource    ${CURDIR}/pages/checkout_overview_page.robot
Resource    ${CURDIR}/pages/checkout_complete_page.robot

#Locator
Resource    ${CURDIR}/locators/login_locator.robot
Resource    ${CURDIR}/locators/product_locator.robot
Resource    ${CURDIR}/locators/cart_locator.robot
Resource    ${CURDIR}/locators/checkout_information_locator.robot
Resource    ${CURDIR}/locators/checkout_overview_locator.robot
Resource    ${CURDIR}/locators/checkout_complete_locator.robot
Resource    ${CURDIR}/locators/common_locator.robot

#data
Variables   ${CURDIR}/../resources/settings/setting.yaml
Variables   ${CURDIR}/../resources/testdata/testdata.yaml