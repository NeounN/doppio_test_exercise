*** Settings ***
Resource    ../pages/login_page.robot
Resource    ../pages/home_page.robot
Resource    ../pages/product_page.robot
Resource    ../pages/cart_page.robot
Resource    ../pages/checkout_page.robot
Resource    ../resources/common.resource
Resource    ../resources/utils.resource

Test Setup       Open app
Test Teardown    Close app

*** Test Cases ***
Test Case - 1
    # Skip    Skipped for now
    Sign in
    Search the keyword        mug
    Select the autocomplete product
    Select color white
    Select quantity           3
    Add product to cart
    Open cart
    
    # Tick product checkbox
    Tick all product checkboxes

    # In Cart pageRead cart page, Read price panel and store in ${subtotal}, ${shipping}, ${vat} variables
    ${subtotal}    ${shipping}    ${vat}=    Read cart page price panel
    Proceed to checkout

    # Read cart page price panel and store in ${total} variables
    ${total}=    Read checkout page price panel
    Validate total    ${total}    ${shipping}    ${vat}    ${subtotal}
    
    # Clear product after validating the price
    Open cart
    Remove product

    # Sleep    3sec

Test Case - 2
    # Skip    Skipped for now
    Sign in
    Search the keyword          Ceramic Mug
    Click search button
    Click product link          Ceramic Mug
    Select color white
    Select quantity           3
    Add product to cart
    Open cart

    # Tick product checkbox
    Tick all product checkboxes

    # In Cart pageRead cart page, Read price panel and store in ${subtotal}, ${shipping}, ${vat} variables
    ${subtotal}    ${shipping}    ${vat}=    Read cart page price panel
    Proceed to checkout

    # Read cart page price panel and store in ${total} variables
    ${total}=    Read checkout page price panel
    Validate total    ${total}    ${shipping}    ${vat}    ${subtotal}
    
    # Clear product after validating the price
    Open cart
    Remove product

    # Sleep    3sec




