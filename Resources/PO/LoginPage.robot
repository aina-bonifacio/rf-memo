*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${LOGIN_TEXT} =    Sign in with Google
${SIGN_IN_BTN} =    xpath=//button[contains(@text, "Sign in")]
${EMAIL_INPUT} =    xpath=//input[@type='email']
${PASSWORD_INPUT} =    name=password
${APPROVE_ACCESS} =    xpath=//*[@id="submit_approve_access"]/div/button
${EMAIL_NEXT} =    xpath=//*[@id="identifierNext"]/div/button
${PASSWORD_NEXT} =    xpath=//*[@id="passwordNext"]/div/button

*** Keywords ***
Navigate To Login Page
    Go To    ${URL.${ENVIRONMENT}}
    Wait Until Page Contains    ${LOGIN_TEXT}
    Click Button    ${SIGN_IN_BTN}

Enter User Credentials
    [Arguments]    ${UserData}
    Input Text    ${EMAIL_INPUT}    ${UserData.Email}
    Click Button    ${EMAIL_NEXT}
    Sleep    5s
    Input Text    ${PASSWORD_INPUT}    ${UserData.Password}
    Click Button    ${PASSWORD_NEXT}
    Wait Until Page Contains Element    ${APPROVE_ACCESS}    10s
    Click Button    ${APPROVE_ACCESS}