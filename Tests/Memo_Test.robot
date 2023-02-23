*** Settings ***
Library    String
Resource    ../Resources/MemoApp.robot
Resource    ../Resources/Common.robot
Test Setup    Common.Begin Web Test
Test Teardown    Common.End Web Test

*** Variables ***
&{CREATE_MEMO_TCOE}    Name=Test Name by Aina    Subject=Test Subject by Aina    Approver=rpa-techno-prod-7@globe.com.ph

*** Test Cases ***
Should be able to see the Homepage screen
#    robot -d results -t "Should be able to see the Homepage screen" Tests/Memo_Test.robot
    [Tags]    homepage
    MemoApp.Verify Home Page Loaded
    MemoApp.Verify TopNav Tabs Present
    MemoApp.Verify View All Memos Button Present
    MemoApp.Verify TCOE Memos Is Displayed

Create new memo with blank inputs
    [Tags]    invalid
#    robot -d results -t "Create new memo with blank inputs" Tests/Memo_Test.robot
    MemoApp.Create Invalid Memo    TCOE - BAU

Create new memo with valid inputs
    [Tags]    valid
#    robot -d results -t "Create new memo with valid inputs" Tests/Memo_Test.robot
    MemoApp.Create Valid Memo    TCOE - BAU    ${CREATE_MEMO_TCOE}
