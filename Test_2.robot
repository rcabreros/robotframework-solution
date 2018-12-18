*** Settings ***
Library           Selenium2Library

*** Variables ***
${url}            https://www.youtube.com/

*** Test Cases ***
test_2
    [Documentation]    Test 2:
    ...
    ...    - Go to youtube.com
    ...    - select the first video under trendings
    ...    - once the selected video loads, click the first video in the "up next" column
    ...    - once the video loads, click the youtube icon
    ...    - check and verify the user is in youtube
    Open Browser    ${url}    gc
    Maximize Browser Window
    #clicking the first video under trendings
    Wait Until Element Is Visible    xpath=//*[@id="title-container" and contains(.,'Trending')]/parent::div/following-sibling::div//*[@id='items']/ytd-grid-video-renderer[1]//a[@id='thumbnail']    300
    Click Link    xpath=//*[@id="title-container" and contains(.,'Trending')]/parent::div/following-sibling::div//*[@id='items']/ytd-grid-video-renderer[1]//a[@id='thumbnail']
    #clicking the first video under UP NEXT
    Sleep    5s
    Wait Until Element Is Visible    xpath=//*[@id="items"]/ytd-compact-autoplay-renderer//a[@id='thumbnail']    300
    Click Link    xpath=//*[@id="items"]/ytd-compact-autoplay-renderer//a[@id='thumbnail']
    #clicking the youtube icon
    Sleep    5s
    Wait Until Element Is Visible    xpath=//*[@id="logo-icon-container"]    300
    Click Element    xpath=//*[@id="logo-icon-container"]
    #checking if the user is in the youtube page/site
    Sleep    5s
    ${youtube_title}=    Get Title
    Should Be Equal    ${youtube_title}    YouTube
    ${curr_url}=    Get Location
    Should Contain    ${curr_url}    youtube
    [Teardown]    Close All Browsers
