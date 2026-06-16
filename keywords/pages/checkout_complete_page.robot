*** Settings ***
Resource    ../import.robot
*** Keywords ***
Verify checkout complete page and url
    SeleniumLibrary.Wait Until Page Contains Element    ${checkout_complete_locator.checkout_complete_component}
    SeleniumLibrary.Page Should Contain    ${checkout_complete_locator.title}
    SeleniumLibrary.Page Should Contain    ${checkout_complete_locator.header}
    SeleniumLibrary.Location Should Contain    ${checkout_complete_locator.path_url}