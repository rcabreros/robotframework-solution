*** Settings ***
Library           Selenium2Library

*** Variables ***
${url}            https://www.google.com/

*** Test Cases ***
going to google
    [Documentation]    Test 1:
    ...
    ...    - Go to Google.com
    ...    - Find a way to go to youtube.com
    ...    - Check if you are in youtube.com
    Open Browser    ${url}    gc
    Maximize Browser Window
    Wait Until Page Contains Element    xpath=//a[@title="Google apps"]    300
    Click Link    xpath=//a[@title="Google apps"]
    Sleep    5s
    Click Link    xpath=//*[@id="gb36"]
    #checking if the user is in the youtube page/site
    ${youtube_title}=    Get Title
    Should Be Equal    ${youtube_title}    YouTube
    ${curr_url}=    Get Location
    Should Contain    ${curr_url}    youtube
    [Teardown]    Close All Browsers
