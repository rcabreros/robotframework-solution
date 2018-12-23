*** Settings ***
Suite Teardown    Close All Browsers
Test Teardown     Close Browser
Library           Selenium2Library

*** Variables ***
${url}            https://automation.dev.coinspectapp.com/
${browser}        ff
${user}           qa_technicaltest
${password}       QWERTYqwerty123!@#
${filepath}       C:\\Users\\ryan\\Desktop\\pics\\

*** Test Cases ***
test_3
    [Documentation]    Test 3:
    ...
    ...    - Go to https://automation.dev.coinspectapp.com/
    ...    - Login
    ...    - Create a new inspection
    ...    - Answer all the questions randomly
    ...    - Mark it as done.
    ...    - Create a report
    ...    - Download the pdf report
    ...    - Open a new tab and view the pdf report
    ...    - Go back to the homepage
    ...    - Check that the DONE count has increased.
    ...    - Logout
    [Setup]    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    #logging in
    Input Text    xpath=//input[@name="email"]    ${user}
    Input Password    xpath=//input[@name="password"]    ${password}
    Click Element    xpath=//input[@value="Login"]
    #getting the DONE count
    ${done_count}=    Get Text    xpath=//h6[contains(.,'DONE')]/preceding-sibling::h1
    #create a new inspection
    Click Element    xpath=//*[@id="impromptuShortcut"]/div[@ng-click="openImpromptuForm()"]
    Wait Until Element Is Visible    xpath=//*[@id="create-inspection"]    300
    Click Element    xpath=//*[@id="withOutUnitsDropdown"]
    Wait Until Element Is Visible    xpath=//*[@id="withOutUnitsDropdown-overlay"]    300
    Wait Until Element Is Visible    xpath=//*[@id="withOutUnitsDropdown-overlay"]//span[contains(.,'Automation A')]    300
    Click Element    xpath=//*[@id="withOutUnitsDropdown-overlay"]//span[contains(.,'Automation A')]
    Wait Until Element Is Visible    xpath=//label[contains(.,'Checklist')]    300
    Click Element    xpath=//*[@id="impromptuChecklistDropdown"]
    Wait Until Element Is Visible    xpath=//*[@id="impromptuChecklistDropdown-overlay"]    300
    Wait Until Element Is Visible    xpath=//*[@id="impromptuChecklistDropdown-overlay"]//span[contains(.,'Automated Color Test')]    300
    Click Element    xpath=//*[@id="impromptuChecklistDropdown-overlay"]//span[contains(.,'Automated Color Test')]
    Click Button    START
    #starting to answer the questions
    Wait Until Element Is Visible    xpath=//header[@ng-click="group.expanded = !group.expanded"]    300
    Click Element    xpath=//header[@ng-click="group.expanded = !group.expanded"]
    Click Element    xpath=//header[@ng-click="group.expanded = !group.expanded"]/following-sibling::ul/li[1]
    #randomizing the answer
    Wait Until Element Is Visible    xpath=//label[contains(.,'Answer')]/following-sibling::div/div    300
    ${div_count}=    Get Element Count    xpath=//label[contains(.,'Answer')]/following-sibling::div/div
    ${rand_ans}=    Evaluate    random.randint(1,${div_count})    modules=random
    Click Element    xpath=//label[contains(.,'Answer')]/following-sibling::div/div[${rand_ans}]
    @{words}=    Create List    hello world    comment 1    new comment    this is robot!    from robot
    ...    watching tv    so cold    the babysitter    reading books
    ${rand_comment}=    Evaluate    random.choice(${words})    modules=random
    Input Text    xpath=//textarea    ${rand_comment}
    @{pics}=    Create List    pic-6.png    pic-5.png    pic-4.png    pic-3.png    pic-2.png
    ...    pic-1.png
    ${rand_pic}=    Evaluate    random.choice(${pics})    modules=random
    Choose File    xpath=//input[@capture="camera" and @type="file"]    ${filepath}${rand_pic}
    Wait Until Element Is Visible    xpath=//figure[@ng-click="edit(img)"]    300
    Click Element    xpath=//figure[@ng-click="edit(img)"]
    Wait Until Element Is Visible    xpath=//textarea[@ng-model="img.comment"]    300
    ${rand_comment}=    Evaluate    random.choice(${words})    modules=random
    Input Text    xpath=//textarea[@ng-model="img.comment"]    ${rand_comment}
    Click Element    xpath=//h3[@ng-click="doNext()"]
    #question 2
    Wait Until Element Is Visible    xpath=//*[@id="ca-dropdown-0"]    300
    Click Button    xpath=//*[@id="ca-dropdown-0"]
    ${div_count2}=    Get Element Count    xpath=//*[@id="ca-dropdown-0-overlay"]/div[2]/div
    ${rand_ans2}=    Evaluate    random.randint(1,${div_count2})    modules=random
    Click Element    xpath=//*[@id="ca-dropdown-0-overlay"]/div[2]/div[${rand_ans2}]
    ${rand_comment}=    Evaluate    random.choice(${words})    modules=random
    Input Text    xpath=//textarea    ${rand_comment}
    ${rand_pic}=    Evaluate    random.choice(${pics})    modules=random
    Choose File    xpath=//input[@type="file"]    ${filepath}${rand_pic}
    Wait Until Element Is Visible    xpath=//figure[@ng-click="edit(img)"]    300
    Click Element    xpath=//figure[@ng-click="edit(img)"]
    Wait Until Element Is Visible    xpath=//textarea[@ng-model="img.comment"]    300
    ${rand_comment}=    Evaluate    random.choice(${words})    modules=random
    Input Text    xpath=//textarea[@ng-model="img.comment"]    ${rand_comment}
    Click Element    xpath=//h3[@ng-click="doNext()"]
    #question 3
    Wait Until Element Is Visible    xpath=//label[contains(.,'Answer')]/following-sibling::div/div    300
    ${div_count3}=    Get Element Count    xpath=//label[contains(.,'Answer')]/following-sibling::div/div
    ${rand_ans3}=    Evaluate    random.randint(1,${div_count3})    modules=random
    Click Element    xpath=//label[contains(.,'Answer')]/following-sibling::div/div[${rand_ans3}]
    ${rand_comment}=    Evaluate    random.choice(${words})    modules=random
    Input Text    xpath=//textarea    ${rand_comment}
    ${rand_pic}=    Evaluate    random.choice(${pics})    modules=random
    Choose File    xpath=//input[@type="file"]    ${filepath}${rand_pic}
    Wait Until Element Is Visible    xpath=//figure[@ng-click="edit(img)"]    300
    Click Element    xpath=//figure[@ng-click="edit(img)"]
    Wait Until Element Is Visible    xpath=//textarea[@ng-model="img.comment"]    300
    ${rand_comment}=    Evaluate    random.choice(${words})    modules=random
    Input Text    xpath=//textarea[@ng-model="img.comment"]    ${rand_comment}
    Click Element    xpath=//h3[@ng-click="doNext()"]
    #question 4
    Wait Until Element Is Visible    xpath=//input[@ng-change="ngChange()"]    300
    ${rand_ans4}=    Evaluate    random.randint(0,20)    modules=random
    Sleep    5s
    Input Text    xpath=//input[@ng-change="ngChange()"]    ${rand_ans4}
    ${rand_comment}=    Evaluate    random.choice(${words})    modules=random
    Input Text    xpath=//textarea    ${rand_comment}
    ${rand_pic}=    Evaluate    random.choice(${pics})    modules=random
    Choose File    xpath=//input[@type="file"]    ${filepath}${rand_pic}
    Wait Until Element Is Visible    xpath=//figure[@ng-click="edit(img)"]    300
    Click Element    xpath=//figure[@ng-click="edit(img)"]
    Wait Until Element Is Visible    xpath=//textarea[@ng-model="img.comment"]    300
    ${rand_comment}=    Evaluate    random.choice(${words})    modules=random
    Input Text    xpath=//textarea[@ng-model="img.comment"]    ${rand_comment}
    Click Element    xpath=//h3[@ng-click="doNext()"]
    #marking it DONE
    Wait Until Element Is Visible    xpath=//*[@id="mark-as-done"]    300
    Click Element    xpath=//*[@id="mark-as-done"]
    Wait Until Element Is Visible    xpath=//*[@id="confirm-modal"]    300
    Click Button    Confirm
    #creating a report
    Wait Until Element Is Visible    xpath=//*[@id="create-report"]    300
    Click Element    xpath=//*[@id="create-report"]
    Wait Until Element Is Visible    xpath=//*[@id="download"]    300
    Click Element    xpath=//*[@id="download"]
    Run Keyword If    '${browser}' == 'gc'    Wait Until Element Is Visible    xpath=//*[@id="plugin"]    300
    #switching back to main tab
    Switch Browser    1
    Wait Until Element Is Visible    xpath=//div[@class="hamburger-button i-hamburger"]    300
    Click Element    xpath=//div[@class="hamburger-button i-hamburger"]
    Wait Until Element Is Visible    xpath=//a//span[contains(.,'Home')]    300
    Click Element    xpath=//a//span[contains(.,'Home')]
    #checking the DONE count has increased
    Sleep    5s
    ${done_inc}=    Get Text    xpath=//h6[contains(.,'DONE')]/preceding-sibling::h1
    Should Be True    '${done_inc}' > '${done_count}'
    #logging out
    Wait Until Element Is Visible    xpath=//div[@class="hamburger-button i-hamburger"]    300
    Click Element    xpath=//div[@class="hamburger-button i-hamburger"]
    Wait Until Element Is Visible    xpath=//a//span[contains(.,"Logout")]    300
    Click Element    xpath=//a//span[contains(.,"Logout")]
