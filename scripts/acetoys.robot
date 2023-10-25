*** Setting ***
Library     SeleniumLibrary

*** Variables ***
${username}     user1
${password}=    pass
#${DRIVER_PATH}    ../robot/scripts/chromedriver
*** Test Cases ***
Login Success
#  Call Keywords
    Open Browser With Chrome
    Login Success With User1    ${username}
    Sleep    6s
    Element Text Should Be    css:#navbarsExampleDefault > form > span      Hi, user1
    Element Text Should Be    css:#navbarsExampleDefault > form > button    Logout
    Sleep    6s

*** Keywords ***
Open Browser With Chrome
    Open Browser	            https://acetoys.uk/our-story        Chrome     # executable_path=${DRIVER_PATH}
    Click Element               id:LoginLink
    Element Text Should Be      xpath://*[@id="CategoryHeader"]      Login

Login Success With User1
    [Arguments]     ${user}     ${pass}=pass
    Input Text      id:username     ${user}
    Input Text      id:password     ${pass}
    Click Button    css:form > button