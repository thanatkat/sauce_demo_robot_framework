*** Settings ***
Resource    ../import.robot
*** Keywords ***
Verify product page and url
    SeleniumLibrary.Wait Until Page Contains Element    ${product_locator.product_list}    timeout=10s
	  SeleniumLibrary.Location Should Contain         	${product_locator.path_url}

Select product
    [Arguments]    ${product}
    SeleniumLibrary.Click Button	  ${product}

Verify cart badge count
    [Arguments]    ${number}
    ${actual}=    SeleniumLibrary.Get Text    ${product_locator.shopping_cart_count}
    BuiltIn.Should Be Equal As Strings    ${actual}    ${number}

Click cart badge
    SeleniumLibrary.Click Element    ${product_locator.cart_badge}
