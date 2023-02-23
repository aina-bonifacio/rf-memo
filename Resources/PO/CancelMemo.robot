*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${CANCEL_TEXT} =    xpath=//div[contains(text(), "Memo cancelled")]
${CANCEL_BTN} =    id=btn_cancel
${REMARKS_INPUT} =    id=txt-reason_a3
${REMARKS_TXT} =    Test
${SUBMIT_BTN} =    xpath=//button[contains(@type, "submit")]
${BACK_BTN} =    xpath=//button[contains(text(), "Back")]

*** Keywords ***
Cancel New Created Memo
    [Arguments]    ${UserData}
    Wait Until Page Contains    ${UserData.Subject}    10s
    Scroll Element Into View    ${CANCEL_BTN}
    Click Button    ${CANCEL_BTN}
    Input Text    ${REMARKS_INPUT}    ${REMARKS_TXT}
    Click Button    ${SUBMIT_BTN}
    Wait Until Element Is Visible    ${CANCEL_TEXT}    20s
    Click Button    ${BACK_BTN}




