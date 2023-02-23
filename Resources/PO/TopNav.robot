*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${CREATE_MEMO} =    xpath=//button[contains(@data-testid, "create")]
${DASHBOARD_TAB} =    xpath=//ol/a[contains(@href, "dashboard")]
${MEMOS_TAB} =    xpath=//ol/a[contains(@href, "memos")]
${APPROVALS_TAB} =    xpath=//ol/a[contains(@href, "approvals")]
${WATCH_TAB} =    xpath=//ol/a[contains(@href, "watch")]

*** Keywords ***
Verify Create Memo Present
    Wait Until Page Contains Element    ${CREATE_MEMO}    30s

Verify My Memos Tab Present
    Page Should Contain Element    ${MEMOS_TAB}

Verify For My Approval Tab Present
    Page Should Contain Element    ${APPROVALS_TAB}

Verify Memos to Watch Tab Present
    Page Should Contain Element    ${WATCH_TAB}

Click Create Memo Button
    Verify Create Memo Present
    Click Button    ${CREATE_MEMO}

Click Dashboard Button
    Click Element    ${DASHBOARD_TAB}


