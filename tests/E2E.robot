*** Settings ***
Resource    ${CURDIR}/../keywords/import.robot

*** Test Cases ***
E2E User Successfully Purchases Product from Login to Order Completion
    common.Open saucedemo
    
    # login
    login_page.Login valid user    ${login}[username]    ${login}[password]  
    
    # select product
    product_page.Verify product page and url
    product_page.Select product    ${product_locator.backpack_btn}
    product_page.Select product    ${product_locator.flashlight_btn}
    product_page.Verify cart badge count    ${product_count}
    product_page.Click cart badge
    
    # verify cart page
    cart_page.Verify cart page and url
    common.Verify product on cart    ${products}[0]
    common.Verify product on cart    ${products}[1]
    cart_page.Click checkout button
    
    # verify checkout information page
    checkout_information_page.Verify checkout overview page and url
    checkout_information_page.Fill information and click continue    ${checkout}[firstname]    ${checkout}[lastname]    ${checkout}[postcode]
    
    # verify checkout overview page
    checkout_overview_page.Verify checkout overview page and url
    common.Verify product on cart    ${products}[0]
    common.Verify product on cart    ${products}[1]
    checkout_overview_page.Verify price total section
    checkout_overview_page.Verify item total price
    checkout_overview_page.Click finish
    
    # verify complete pae
    checkout_complete_page.Verify checkout complete page and url
    
    # logout
    common.Click Logout

    # verify login page
    login_page.Verify login page and url
    common.Close browser