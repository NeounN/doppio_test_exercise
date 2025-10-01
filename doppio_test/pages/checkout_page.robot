*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/utils.resource

*** Variables ***
${TOTAL_TXT}            dom:document.querySelector('[data-testid="shadow-host"]').shadowRoot.querySelector('[data-testid="checkout-total"]')

*** Keywords ***
Read checkout page price panel
    Wait Until Page Contains Element   ${TOTAL_TXT}    3s
    Wait Until Keyword Succeeds    5s    500ms    Element Text Should Not Be    ${TOTAL_TXT}    THB 0.00
    
    ${total_txt}=    Get Text    ${TOTAL_TXT}
    ${total}=        THB Text To Number    ${total_txt}

    Log To Console    ${EMPTY}
    Log To Console    Get value from cart page price panel
    Log To Console    4 - Subtotal is number: ${total}

    RETURN    ${total}

