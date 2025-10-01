*** Settings ***
Library    SeleniumLibrary
Library    String
Resource   ../resources/utils.resource

*** Variables ***
${QTY_INPUT_BOX}              dom:document.querySelector('[data-testid="shadow-host"]').shadowRoot.querySelector('[data-testid="pd-qty-input"]')
# Idea for future improvement - receive keyword then pick color -> ${COLOR_OPTION}     dom:document.querySelector('[data-testid="shadow-host"]').shadowRoot.querySelector('[data-testid="pd-opt-color-${color}"]')
${COLOR_OPTION_WHITE}         dom:document.querySelector('[data-testid="shadow-host"]').shadowRoot.querySelector('[data-testid="pd-opt-color-White"]')
${COLOR_OPTION_GRAY}          dom:document.querySelector('[data-testid="shadow-host"]').shadowRoot.querySelector('[data-testid="pd-opt-color-Gray"]')

${ADD_TO_CART_BTN}            dom:document.querySelector('[data-testid="shadow-host"]').shadowRoot.querySelector('[data-testid="pd-add-to-cart"]')
${TOAST_ADD_TO_CART_SUCCESS_MESSAGE}    Added to cart
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
