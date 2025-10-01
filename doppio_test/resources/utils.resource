*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
THB Text To Number
    [Arguments]    ${text}
    ${clean}=    Replace String    ${text}    THB    ${EMPTY}
    ${clean}=    Replace String    ${clean}   ,      ${EMPTY}
    ${clean}=    Strip String      ${clean}
    ${number}=    Convert To Number    ${clean}
    RETURN      ${number}

Validate total
    [Arguments]    ${total}    ${shipping}    ${vat}    ${subtotal}
    ${expected_total}=    Evaluate    ${subtotal} + ${shipping} + ${vat}
    Should Be Equal As Numbers    ${expected_total}    ${total}    msg=❌ Total price mismatch
    Log To Console    ✅ Price calculation matches: ${subtotal} + ${shipping} + ${vat} = ${total}



