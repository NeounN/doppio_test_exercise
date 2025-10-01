*** Settings ***
Library     SeleniumLibrary    
...    timeout=10s    
...    implicit_wait=2s

*** Variables ***
${BASE_URL}    https://training-platform2.doppio-tech.com/
${EMAIL}       tellstoryneo@gmail.com
${PASSWORD}    Tempdoppio123

*** Keywords ***
Open app
    Open Browser    ${BASE_URL}    chrome
    Maximize Browser Window
    Wait Until Page Contains Element    id=nav-search-input

Close app
    Close All Browsers




