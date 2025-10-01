*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Resource   ../resources/utils.resource

*** Variables ***
${USER_MENU_BTN}    css=[data-testid="nav-account-button"]
${SIGN_IN_LINK}     css=[data-testid="nav-account-signin"]

${EMAIL_INPUT}            dom:document.querySelector('[data-testid="shadow-host"]').shadowRoot.querySelector('[data-testid="signin-email"]')
${PASSWORD_INPUT}         dom:document.querySelector('[data-testid="shadow-host"]').shadowRoot.querySelector('[data-testid="signin-password"]')
${SIGN_IN_BTN}            dom:document.querySelector('[data-testid="shadow-host"]').shadowRoot.querySelector('[data-testid="signin-submit"]')
${TOAST_SUCCESS_MESSAGE}    Signed in successfully

*** Keywords ***
Sign in
    Click Element    ${USER_MENU_BTN}

    Wait Until Page Contains Element    ${SIGN_IN_LINK}
    Click Element    ${SIGN_IN_LINK}

    Wait Until Page Contains Element    ${EMAIL_INPUT}
    Input Text    ${EMAIL_INPUT}    ${EMAIL}
    Input Text    ${PASSWORD_INPUT}    ${PASSWORD}

    Click Element    ${SIGN_IN_BTN}

    Wait Until Page Contains    ${TOAST_SUCCESS_MESSAGE}    5s







