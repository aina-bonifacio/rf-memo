*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${MEMO_CREATED_CHECK} =    xpath=//td[contains(text(), "

*** Keywords ***
Verify Created Memo Is Present
    [Arguments]    ${XP_FULL}
    ${MEMO_XP_FULL} =    Get Created Memo XPATH    ${XP_FULL}
    Wait Until Page Contains Element    ${MEMO_XP_FULL}    10s

Get Created Memo XPATH
    [Arguments]    ${UserData}
    ${XP_FULL} =    Catenate    ${MEMO_CREATED_CHECK}${UserData.Subject}")]
    [Return]    ${XP_FULL}



