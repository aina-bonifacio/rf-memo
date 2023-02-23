*** Settings ***
Library    SeleniumLibrary
Resource    MemoApp.robot

*** Variables ***


*** Keywords ***
Begin Web Test
    Open Browser    about:blank    ${BROWSER}
    Maximize Browser Window
    MemoApp.Login User Account    ${CREATOR}

End Web Test
    Close Browser