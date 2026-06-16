*** Settings ***
Resource    ../import.robot
*** Keywords ***
Verify checkout overview page and url
    SeleniumLibrary.Wait Until Page Contains Element      ${checkout_overview_locator.checkout_summary}    timeout=10s
    SeleniumLibrary.Wait Until Page Contains    ${checkout_overview_locator.title}    timeout=10s
    SeleniumLibrary.Location Should Contain     ${checkout_overview_locator.path_url} 

Get text locator
    [Arguments]    ${locator}
    ${text}=    SeleniumLibrary.Get Text    ${locator}
    RETURN    ${text}

Clean string
    [Arguments]    ${text}    ${remove_text}
    ${clean_text}=    String.Remove String    ${text}    ${remove_text}   
    RETURN    ${clean_text}

Convert text to number
    [Arguments]    ${text}
    ${number}=    BuiltIn.Convert To Number    ${text}
    RETURN    ${number}

Sum number
    [Arguments]    ${number_1}    ${number_2}
    ${sum}=    BuiltIn.Evaluate    ${number_1} + ${number_2}
    RETURN    ${sum}

Compare Values
    [Arguments]    ${actual}    ${expected}
    Should Be Equal    ${actual}    ${expected}

Verify item total price
    # Get all product prices
    ${product_elements}=    SeleniumLibrary.Get WebElements    ${checkout_overview_locator.product_prices}
    
    ${item_total_cal}=    Set Variable    ${0}
    FOR    ${element}    IN    @{product_elements}
        ${text}=      Get text locator          ${element}
        ${clean}=     Clean string              ${text}    $
        ${number}=    Convert text to number    ${clean}
        ${item_total_cal}=    Sum number        ${item_total_cal}    ${number}
    END

    # Get displayed values
    ${item_total_text}=    Get text locator    ${checkout_overview_locator.item_total_text}
    ${tax_text}=           Get text locator    ${checkout_overview_locator.tax_text}
    ${total_text}=         Get text locator    ${checkout_overview_locator.total_text}

    ${item_total}=    Clean string    ${item_total_text}    Item total: $
    ${tax}=           Clean string    ${tax_text}           Tax: $
    ${total}=         Clean string    ${total_text}         Total: $

    ${item_total}=    Convert text to number    ${item_total}
    ${tax}=           Convert text to number    ${tax}
    ${total}=         Convert text to number    ${total}

    ${total_with_tax}=    Sum number    ${item_total_cal}    ${tax}
    
    Compare Values    ${item_total}      ${item_total_cal}
    Compare Values    ${total}           ${total_with_tax}

Verify price total section
    SeleniumLibrary.Page Should Contain    ${checkout_overview_locator.item_total_title}
    SeleniumLibrary.Page Should Contain    ${checkout_overview_locator.tax_title}
    SeleniumLibrary.Page Should Contain    ${checkout_overview_locator.total_title}

Click finish
    SeleniumLibrary.Click Button    ${checkout_overview_locator.finish_btn}
