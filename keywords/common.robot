*** Settings ***
Resource    ./import.robot

*** Variables ***
${CHROME_OPTIONS}     add_argument("--disable-save-password-bubble");add_argument("--disable-notifications");add_experimental_option("prefs", {"credentials_enable_service": False, "profile.password_manager_enabled": False, "profile.password_manager_leak_detection": False})

*** Keywords ***
Open saucedemo
    SeleniumLibrary.Open Browser    ${url}    browser=chrome    options=${CHROME_OPTIONS}
    SeleniumLibrary.Maximize Browser Window

Close browser
    SeleniumLibrary.Close browser

Verify product on cart
    [Arguments]    ${product}
    SeleniumLibrary.Page Should Contain    ${product}

Click Logout
    SeleniumLibrary.Click Button    ${common_locator.burger_menu_btn}
    SeleniumLibrary.Wait Until Element Is Visible   ${common_locator.sidebar}
    SeleniumLibrary.Click Element    ${common_locator.logout_btn}