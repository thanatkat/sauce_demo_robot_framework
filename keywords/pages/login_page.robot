*** Settings ***
Resource    ../import.robot
*** Keywords ***
Login valid user
    [Arguments]    ${username}    ${password}
    SeleniumLibrary.Input Text        ${login_locator.username_input}    ${username}
    SeleniumLibrary.Input Text        ${login_locator.password_input}    ${password}
    SeleniumLibrary.Click Button      ${login_locator.login_btn}

Verify login page and url
    SeleniumLibrary.Page Should Contain Element    ${login_locator.login_title}
    SeleniumLibrary.Page Should Contain Element    ${login_locator.login_component}
    SeleniumLibrary.Location Should Contain        ${url}