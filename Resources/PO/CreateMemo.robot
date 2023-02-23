*** Settings ***
Library    SeleniumLibrary
Library    Collections
Resource    ../../init.robot

*** Variables ***
${CREATE_MEMO_TEXT} =    Create new memo

${MEMO_XPATH} =    xpath=//h4[contains(text(), "
${TCOE_BAU} =    xpath=//h4[contains(text(), "TCOE - BAU Service Request")]
${TCOE_CLOSEOUT} =    xpath=//h4[contains(text(), "TCOE - Closeout Report")]
${TCOE_CHANGE_REQ} =    xpath=//h4[contains(text(), "TCOE - Change Request")]
${TCOE_MOR} =    xpath=//h4[contains(text(), "TCOE - Monthly Operations Report")]
${TCOE_DEVFORM} =    xpath=//h4[contains(text(), "TCoE Deviation Form")]

${FORM_TEXT} =    Please fill out the form below
@{required_fields} =    Project Name *    Subject *    Approvers

${PROJECT_NAME_INPUT} =    name=mi8qnavlRGYLc2QFDCTzU
${SUBJECT_INPUT} =    name=TEXT_SUBJECT
${APPROVER_INPUT} =    xpath=//input[contains(@name, "pro")]
${UPLOAD} =    xpath=//*[@id="cell-content-8v3jPb-xl2s_S2EitFGTO"]//button
${SUBMIT} =    id=submit

${REQUIRED_TEXT} =    xpath=//p[1][contains(text(), "required")]/preceding-sibling::label

${UPLOAD_INPUT} =    xpath=//div/input[@type="file"]
${APPROVER_EMAIL} =    xpath=//div[contains(@data-email, "rpa")]
${SUBMIT_SUCCESS_TXT} =    xpath=//div[contains(text(), "submitted")]
${SUBMIT_SUCCESS_BTN} =    xpath=//button[contains(text(), "Okay, got it!")]

*** Keywords ***
Verify Create Memo Page Loaded
    Wait Until Page Contains    ${CREATE_MEMO_TEXT}

Verify TCOE Memos is Displayed
    Sleep    5s
    Scroll Element Into View    ${TCOE_CLOSEOUT}
    Scroll Element Into View    ${TCOE_BAU}
    Scroll Element Into View    ${TCOE_CHANGE_REQ}
    Scroll Element Into View    ${TCOE_MOR}
    Scroll Element Into View    ${TCOE_DEVFORM}

Click Memo Form
    [Arguments]    ${XP_FULL}
    Sleep    10s
    ${MEMO_XP_FULL} =    Get Memo Form XPATH    ${XP_FULL}
    Scroll Element Into View    ${MEMO_XP_FULL}
    Click Element    ${MEMO_XP_FULL}
    Wait Until Page Contains    ${FORM_TEXT}   20s

Get Memo Form XPATH
    [Arguments]    ${MEMO_TYPE}
    ${XP_FULL} =    Catenate    ${MEMO_XPATH}${MEMO_TYPE}")]
    [Return]    ${XP_FULL}

Click Submit Memo Button
    Scroll Element Into View    ${SUBMIT}
    Click Button    ${SUBMIT}

Verify Required Field Texts
    @{required_text_alert} =    Get WebElements    ${REQUIRED_TEXT}
    @{text_alerts} =    Create List
    FOR    ${alerts}    IN    @{required_text_alert}
        ${alert} =    Get Text    ${alerts}
        Append To List    ${text_alerts}    ${alert}
    END
    Log To Console    ${text_alerts}

    List Should Contain Sub List    ${text_alerts}    ${required_fields}

Create New Memo
    [Arguments]    ${UserData}
    Input Text    ${PROJECT_NAME_INPUT}    ${UserData.Name}
    Input Text    ${SUBJECT_INPUT}    ${UserData.Subject}
    Choose File    ${UPLOAD_INPUT}   ${RESOURCES_DIR}/Sample.docx
    Input Text    ${APPROVER_INPUT}    ${UserData.Approver}
    Wait Until Element Is Visible    ${APPROVER_EMAIL}    30s
    Click Element    ${APPROVER_EMAIL}
    Click Button    ${SUBMIT}
    Wait Until Page Contains Element    ${SUBMIT_SUCCESS_TXT}    20s
    Click Button    ${SUBMIT_SUCCESS_BTN}





