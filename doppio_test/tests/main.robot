*** Settings ***
Library    SeleniumLibrary
Library    String
Library    OperatingSystem

*** Variables ***
${URL}          https://training-platform2.doppio-tech.com/products/11
${URL_login}    https://training-platform2.doppio-tech.com/signin
${BROWSER}      chrome
${QTY_INPUT}    dom:document.querySelector('[data-testid="shadow-host"]').shadowRoot.querySelector('#qty-input')
${USERNAME_INPUT}    dom:document.querySelector('[data-testid="shadow-host"]').shadowRoot.querySelector('[data-testid="signin-email"]')
# ${USERNAME_INPUT}    dom:document.querySelector('[data-testid="shadow-host"]').shadowRoot.querySelector('[data-testid="pd-qty-input"]')
${PASSWORD_INPUT}    locator_here

# ${URL}         https://training-platform2.doppio-tech.com/products/11
# ${BROWSER}     chrome
# ${qty_input}   dom:document.querySelector('[data-testid="shadow-host"]').shadowRoot.querySelector('#qty-input')


*** Keywords ***
Set Quantity To
    [Arguments]    ${value}
    Wait Until Element Is Visible    ${QTY_INPUT}    15s
    Click Element    ${QTY_INPUT}
    Press Keys       ${QTY_INPUT}    CTRL+a
    Input Text       ${QTY_INPUT}    ${value}

*** Test Cases ***
test login_page
    Open Browser    ${URL_login}    browser=${BROWSER}
    Wait Until Element Is Visible    ${USERNAME_INPUT}
    Click Element    ${USERNAME_INPUT}
    Input Text       ${USERNAME_INPUT}    allah

    Sleep    2s    # just to see the result before closing
    Close Browser

# Update Quantity To 3
#     Open Browser    ${URL}    browser=${BROWSER}
#     Set Quantity To    3
#     Sleep    2s    # just to see the result before closing
#     Close Browser


    # Input Text    id=nav-search-xxxx    eiei5555lol     


# Find Elements
#     Open Browser    ${URL}    browser=${BROWSER}
#     Wait Until Element Is Visible    ${QTY_INPUT_BOX}    15s
#     Click Element    ${QTY_INPUT_BOX}
#     Input Text       ${QTY_INPUT_BOX}    10