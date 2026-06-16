*** Settings ***
Resource    ../import.robot
*** Keywords ***
Verify cart page and url
    SeleniumLibrary.Wait Until Page Contains Element    ${cart_locator.cart_list}    timeout=10s
    SeleniumLibrary.Location Should Contain    ${cart_locator.path_url}

Click checkout button
    SeleniumLibrary.Click Button    ${cart_locator.checkout_btn}