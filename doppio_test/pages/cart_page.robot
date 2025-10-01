*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    XML
Resource    ../resources/utils.resource

*** Variables ***
${CART_ICON_NAV}    css=[data-testid="nav-cart"]

${PROCEED_BTN}                dom:document.querySelector('[data-testid="shadow-host"]').shadowRoot.querySelector('[data-testid="cart-proceed"]')
${PLACE_ORDER_BTN}            dom:document.querySelector('[data-testid="shadow-host"]').shadowRoot.querySelector('[data-testid="checkout-place-order"]')

${SELECT_ALL_CHECKBOX}        dom:document.querySelector('[data-testid="shadow-host"]').shadowRoot.querySelector('[data-cart="cart-div0-div1-div0-label0-input0"]')
${PRODUCT33_MUG_CHECKBOX}     dom:document.querySelector('[data-testid="shadow-host"]').shadowRoot.querySelector('#chk-select-33')

${SUBTOTAL_TXT}               dom:document.querySelector('[data-testid="shadow-host"]').shadowRoot.querySelector('[data-cart="cart-div0-div1-div1-aside1-section0-div1-span1"]')
${SHIPPING_TXT}               dom:document.querySelector('[data-testid="shadow-host"]').shadowRoot.querySelector('[data-cart="cart-div0-div1-div1-aside1-section0-div2-span1"]')
${VAT_TXT}                    dom:document.querySelector('[data-testid="shadow-host"]').shadowRoot.querySelector('[data-cart="cart-div0-div1-div1-aside1-section0-div3-span1"]')
# ${DISCOUNT_TXT}    locator_here

*** Keywords ***
Open cart
    Click Element    ${CART_ICON_NAV}
    Wait Until Page Contains Element   ${PROCEED_BTN}    3s

Tick product checkbox
    Click Element    ${PRODUCT33_MUG_CHECKBOX}
    Wait Until Page Contains Element   ${PROCEED_BTN}    3s

Tick all product checkboxes
    Click Element    ${SELECT_ALL_CHECKBOX}
    Wait Until Page Contains Element   ${PROCEED_BTN}    3s

Proceed to checkout
    Click Element    ${PROCEED_BTN}
    Wait Until Page Contains Element   ${PLACE_ORDER_BTN}    3s 

Read cart page price panel
    Wait Until Page Contains Element   ${SUBTOTAL_TXT}    3s
    Wait Until Keyword Succeeds    5s    500ms    Element Text Should Not Be    ${SUBTOTAL_TXT}    THB 0.00

    ${subtotal_txt}=    Get Text    ${SUBTOTAL_TXT}
    ${shipping_txt}=    Get Text    ${SHIPPING_TXT}
    ${vat_txt}=         Get Text    ${VAT_TXT}
    # ${discount_txt}     Get Text    ${DISCOUNT_TXT}

    ${subtotal}=        THB Text To Number    ${subtotal_txt}
    ${shipping}=        THB Text To Number    ${shipping_txt}
    ${vat}=             THB Text To Number    ${vat_txt}
    # ${discount}=        THB Text To Number    ${discount_txt}
    
    Log To Console    ${EMPTY}
    Log To Console    Get value from cart
    Log To Console    1 - Subtotal is number: ${subtotal}
    Log To Console    2 - shipping is number: ${shipping}
    Log To Console    3 - vat is number: ${vat}

    RETURN    ${subtotal}    ${shipping}    ${vat}
