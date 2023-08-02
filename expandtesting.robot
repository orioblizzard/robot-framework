*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${username}     orioblizzard@gmail.com
${password}=     P@ssw0rd

*** Test Cases ***
Ensure that customers able to login success
    Login Success   ${username}     ${password}

Ensure that customers able to Add Note
    Login Success   ${username}     ${password}
    Create Note success    Personal   Title demo    description demo

Ensure that customers able to Delete Note
    Login Success   ${username}     ${password}
    Create Note success    Personal   Title demo    description demo
    Wait Until Keyword Succeeds    1 min    2 s     Scroll Element Into View    xpath://button[text()='Delete']
    Wait Until Keyword Succeeds    1 min    2 s     Click Element    xpath://button[text()='Delete']
    Element Text Should Be    //*[@id="root"]/div/div/div[2]/div/div[4]/div[2]/div/div[4]/div/div/div/div/div[1]/div       Delete note?
    Click Element    xpath://*[@id="root"]/div/div/div[2]/div/div[4]/div[2]/div/div[4]/div/div/div/div/div[3]/button[1]

*** Keywords ***
Login success
    [Arguments]    ${user}      ${pass}
    Open Browser    https://practice.expandtesting.com/notes/app    Chrome
    ...             options=add_experimental_option("detach", True)
    Maximize Browser Window
    Click Element   xpath://*[@id="root"]/div/div/div/div[1]/div[1]/a[1]
    Element Should Be Visible       css:#root > div > div > div > div > h1
    Input Text      id:email        ${user}
    Input Text      name:password   ${pass}
    Click Button    xpath://*[@id="root"]/div/div/div/div/form/div[2]/button

Create Note success
    [Arguments]    ${category}      ${title}        ${description}
    Wait Until Element Is Visible    xpath://*[@id="root"]/div/div/div[2]/div/div[2]/div[2]/button
    Click Element    xpath://*[@id="root"]/div/div/div[2]/div/div[2]/div[2]/button
    Element Should Be Visible    xpath://*[@id="root"]/div/div/div[2]/div/div[3]/div/div/div[1]/div
    Select From List By Value    id:category     ${category}
    Select Checkbox     id:completed
    Input Text       id:title            ${title}
    Input Text       id:description      ${description}
    Click Element    xpath://*[@id="root"]/div/div/div[2]/div/div[3]/div/div/form/div[2]/button[1]
    Wait Until Element Is Visible    //*[@id="root"]/div/div/div[2]/div/div[4]/div[2]/div/div[2]
    Element Text Should Be    //*[@id="root"]/div/div/div[2]/div/div[4]/div[2]/div/div[2]           ${title}
    Element Text Should Be    //*[@id="root"]/div/div/div[2]/div/div[4]/div[2]/div/div[3]/p[1]      ${description}