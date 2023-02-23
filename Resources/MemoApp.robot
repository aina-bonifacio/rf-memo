*** Settings ***
Library    SeleniumLibrary
Resource    ./PO/LoginPage.robot
Resource    ./PO/Homepage.robot
Resource    ./PO/TopNav.robot
Resource    ./PO/CreateMemo.robot
Resource    ./PO/MemosPage.robot

*** Keywords ***
Login User Account
    [Arguments]    ${UserData}
    LoginPage.Navigate To Login Page
    LoginPage.Enter User Credentials    ${UserData}

Verify Home Page Loaded
    Homepage.Verify Home Page
    Homepage.Verify My Memos Present
    Homepage.Verify For My Approval Present
    Homepage.Verify Memos to Watch Present

Verify TopNav Tabs Present
    TopNav.Verify My Memos Tab Present
    TopNav.Verify For My Approval Tab Present
    TopNav.Verify Memos to Watch Tab Present

Verify View All Memos Button Present
    Homepage.Verify View All Memos Present
    Homepage.Verify View All For Approval Memos Present
    Homepage.Verify View All Memos To Watch Present

Verify TCOE Memos Is Displayed
    TopNav.Click Create Memo Button
    CreateMemo.Verify TCOE Memos is Displayed

Create Invalid Memo
    [Arguments]    ${MEMO_TYPE}
    TopNav.Verify Create Memo Present
    TopNav.Click Create Memo Button
    CreateMemo.Verify Create Memo Page Loaded
    CreateMemo.Click Memo Form    ${MEMO_TYPE}
    CreateMemo.Click Submit Memo Button
    CreateMemo.Verify Required Field Texts

Create Valid Memo
    [Arguments]    ${MEMO_TYPE}    ${UserData}
    TopNav.Verify Create Memo Present
    TopNav.Click Create Memo Button
    CreateMemo.Verify Create Memo Page Loaded
    CreateMemo.Click Memo Form    ${MEMO_TYPE}
    CreateMemo.Create New Memo    ${UserData}
    MemosPage.Verify Created Memo Is Present    ${UserData}
    Sleep    5s
    TopNav.Click Dashboard Button
    Homepage.Verify Created Memo Is Present    ${UserData}




