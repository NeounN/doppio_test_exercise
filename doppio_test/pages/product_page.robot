*** Settings ***
Library    SeleniumLibrary
Library    String
Resource   ../resources/utils.resource

*** Variables ***
${QTY_INPUT_BOX}    dom:document.querySelector('[data-testid="shadow-host"]').shadowRoot.querySelector('[data-testid="pd-qty-input"]')
${COLOR_OPTION_WHITE}     dom:document.querySelector('[data-testid="shadow-host"]').shadowRoot.querySelector('[data-testid="pd-opt-color-White"]')
${COLOR_OPTION_GRAY}     dom:document.querySelector('[data-testid="shadow-host"]').shadowRoot.querySelector('[data-testid="pd-opt-color-Gray"]')
# ${COLOR_OPTION}     dom:document.querySelector('[data-testid="shadow-host"]').shadowRoot.querySelector('[data-testid="pd-opt-color-${color}"]')

${ADD_TO_CART_BTN}    dom:document.querySelector('[data-testid="shadow-host"]').shadowRoot.querySelector('[data-testid="pd-add-to-cart"]')
${TOAST_ADD_TO_CART_SUCCESS_MESSAGE}    Added to cart
# ${NAV_CART_LINK}    id=btn-cart
${NAV_CART_LINK}    css=[data-testid="nav-cart"]

*** Keywords ***
Select color white
    Wait Until Element Is Visible    ${COLOR_OPTION_WHITE}
    Click Element    ${COLOR_OPTION_WHITE}

Select color gray
    Wait Until Element Is Visible    ${COLOR_OPTION_GRAY}
    Click Element    ${COLOR_OPTION_GRAY}

Select quantity
    [Arguments]    ${qty}
    Wait Until Element Is Visible    ${QTY_INPUT_BOX}
    Click Element    ${QTY_INPUT_BOX}
    Press Keys    ${QTY_INPUT_BOX}    CTRL+a
    Input Text    ${QTY_INPUT_BOX}    ${qty}

Add product to cart
    Wait Until Element Is Enabled    ${ADD_TO_CART_BTN}    5s
    Click Button    ${ADD_TO_CART_BTN}
    Wait Until Page Contains    ${TOAST_ADD_TO_CART_SUCCESS_MESSAGE}    5s


    # // TODO Next
    # 1. Add to the cart -> successfully + has toast successfully
    # 2. handle >10 product case ->
    # 3. (Maybe) change Login_page Variables name from ${TOAST_SUCCESS_MESSAGE} -> ${TOAST_LOGIN_SUCCESS_MESSAGE}







# Enter quantity
    # [Arguments]    ${qty}
    # ${input}=    Get Shadow Element    ${QTY_SHADOW_HOST}    ${QTY_INPUT_SELECTOR}
    # Execute Javascript    arguments[0].value = ""    ${input}
    # Execute Javascript    arguments[0].value = "${qty}"    ${input}
    # Execute Javascript    arguments[0].dispatchEvent(new Event("input", { bubbles: true }))    ${input}

    # Input Text    id=nav-search-xxxx    eiei5555lol




# Add to cart
#     Click Button    ${ADD_TO_CART_BTN}
#     Wait Until Page Contains    Added to cart    5s

# Read price panel
#     ${subtotal_txt}=    Get Text    ${SUBTOTAL_TXT}
#     ${vat_txt}=         Get Text    ${VAT_TXT}
#     ${total_txt}=       Get Text    ${TOTAL_TXT}
#     ${subtotal}=        Thb text to number    ${subtotal_txt}
#     ${vat}=             Thb text to number    ${vat_txt}
#     ${total}=           Thb text to number    ${total_txt}
#     [Return]    ${subtotal}    ${vat}    ${total}

# Verify vat and total on pdp
#     ${subtotal}    ${vat}    ${total}=    Read price panel
#     ${expected_vat}=    Evaluate    round(float(${subtotal}) * 0.07, 2)
#     Should Be True    abs(${expected_vat} - float(${vat})) < 0.06
#     ${expected_total}=  Evaluate    float(${subtotal}) + float(${vat})
#     Should equal money  ${expected_total}    ${total}
