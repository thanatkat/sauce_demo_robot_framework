*** Settings ***
Resource    ../import.robot
*** Keywords ***
Verify checkout overview page and url
    SeleniumLibrary.Wait Until Page Contains Element      ${checkout_information_locator.information_card}    timeout=10s
    SeleniumLibrary.Wait Until Page Contains	    ${checkout_information_locator.title} 
    SeleniumLibrary.Location Should Contain       ${checkout_information_locator.path_url} 

Fill information and click continue
    [Arguments]    ${firstname}    ${lastname}    ${postcode}
    SeleniumLibrary.Input Text        ${checkout_information_locator.firstname_input}    ${firstname}
    SeleniumLibrary.Input Text        ${checkout_information_locator.lastname_input}    ${lastname}
    SeleniumLibrary.Input Text        ${checkout_information_locator.postcode}    ${postcode}
    SeleniumLibrary.Click Button      ${checkout_information_locator.continue_btn}