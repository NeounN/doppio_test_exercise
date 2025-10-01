*** Settings ***
Resource    ../resources/common.resource
Resource    ../resources/utils.resource

Resource    ../pages/login_page.robot
Resource    ../pages/home_page.robot
Resource    ../pages/product_page.robot
Resource    ../pages/cart_page.robot
Resource    ../pages/checkout_page.robot


Test Setup       Open app
Test Teardown    Close app


*** Test Cases ***

Test Case - 1
    # Skip    Skipped for now
    Sign in
    Search the keyword        mug
    Select the autocomplete product
    Select color gray
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

    # Sleep    3sec

Test Case - 2
    # Skip    Skipped for now
    Sign in
    Search the keyword          Ceramic Mug
    Click search button
    Sleep    2s
    Click product link          Ceramic Mug

    Select color gray
    Select quantity           3
    Add product to cart
    Open cart

    Tick all product checkboxes

    # In Cart pageRead cart page, Read price panel and store in ${subtotal}, ${shipping}, ${vat} variables
    ${subtotal}    ${shipping}    ${vat}=    Read cart page price panel
    Proceed to checkout

    # Read cart page price panel and store in ${total} variables
    ${total}=    Read checkout page price panel
    Validate total    ${total}    ${shipping}    ${vat}    ${subtotal}




    Sleep    3sec




