*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${WELCOME_TEXT} =    Welcome, Mat
${MEMOS_TXT} =    My memos
${APPROVAL_TXT} =    For my approval
${WATCH_TXT} =    Memos to watch
${DASHBOARD_MEMO_ALL} =    xpath=//div[3]/a[contains(@href, "/memos/active")]
${DASHBORAD_APPROVAL_ALL} =    xpath=//div[3]/a[contains(@href, "/approvals")]
${DASHBOARD_WATCH_ALL} =    xpath=//div[3]/a[contains(@href, "/watch")]
${MEMO_CREATED} =    xpath=//p[contains(text(), "

*** Keywords ***
Verify Home Page
    Wait Until Page Contains    ${WELCOME_TEXT}    20s

Verify My Memos Present
    Page Should Contain    ${MEMOS_TXT}

Verify For My Approval Present
    Page Should Contain    ${APPROVAL_TXT}

Verify Memos to Watch Present
    Page Should Contain    ${WATCH_TXT}

Verify View All Memos Present
    Scroll Element Into View    ${DASHBOARD_MEMO_ALL}

Verify View All For Approval Memos Present
    Scroll Element Into View    ${DASHBORAD_APPROVAL_ALL}

Verify View All Memos To Watch Present
    Scroll Element Into View    ${DASHBOARD_WATCH_ALL}

Verify Created Memo Is Present
    [Arguments]    ${XP_FULL}
    ${MEMO_XP_FULL} =    Get Created Memo XPATH    ${XP_FULL}
    Wait Until Page Contains Element    ${MEMO_XP_FULL}

Get Created Memo XPATH
    [Arguments]    ${UserData}
    ${XP_FULL} =    Catenate    ${MEMO_CREATED}${UserData.Subject}")]
    [Return]    ${XP_FULL}



