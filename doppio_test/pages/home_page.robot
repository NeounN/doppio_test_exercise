*** Settings ***
Library    SeleniumLibrary
# Library    OperatingSystem

*** Variables ***
${SEARCH_INPUT}    css=[data-testid="nav-search-input"]
${SEARCH_BTN}    css=[data-testid="nav-search-submit"]

${AUTO_SUGGEST_ITEM}    css=[data-testid="nav-search-suggest"]

# Alternative to ${AUTO_SUGGEST_ITEM}, If only want to be specific for Auto-suggest "Ceramic Mug"
${AUTO_SUGGEST_ITEM_CERAMIC_MUG}    xpath=//div[@id="nav-search-suggest"]//a[normalize-space()="Ceramic Mug"]

${PRODUCT_LINK}    dom:document.querySelector('[data-testid="shadow-host"]').shadowRoot.querySelector('a[href="/products/11"]')
${PRODUCT_LINK_CERAMIC_MUG}    dom:document.querySelector('[data-testid="shadow-host"]').shadowRoot.querySelector('a[data-testid="product-card-name-11"]')


*** Keywords ***
Search the keyword
    [Arguments]    ${query}
    Click Element    ${SEARCH_INPUT}
    Input Text    ${SEARCH_INPUT}    ${query}

Select the autocomplete product
    Wait Until Page Contains Element    ${AUTO_SUGGEST_ITEM}
    Click Element    ${AUTO_SUGGEST_ITEM}

Click search button
    Click Element    ${SEARCH_BTN}
    Wait Until Page Contains Element   ${PRODUCT_LINK}    3s

Click product link
    [Arguments]    ${keyword}
    # Use XPath to match product name in the search result list
    ${product_locator}=    Set Variable    xpath=//a[contains(., "${keyword}")]
    Wait Until Page Contains Element    ${product_locator}    5s
    Click Element    ${product_locator}

Click ceramic mug link
    Wait Until Page Contains Element    ${PRODUCT_LINK_CERAMIC_MUG}    5s
    Click Element    ${PRODUCT_LINK_CERAMIC_MUG}

    




