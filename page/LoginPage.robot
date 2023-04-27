*** Settings ***
Resource            ../framework/router.robot

*** Variables ***
${loginpage_field_email}                            xpath=//input[@id='user-name']
${loginpage_field_password}                         xpath=//input[@id='password']
${loginpage_button_login}                          css=input#login-button

*** Keywords ***
Login With Credentials
    User Can Input Username And Password In Login Page
    User Can Tap Button Sign In In Login Page

User Can Input Username And Password In Login Page
    [Arguments]      ${username}=${STANDARD_USER}      ${password}=${USER_PASSWORD}
    Wait Until Element Is Visible                   ${loginpage_field_email}
    Input Text                                      ${loginpage_field_email}            ${username}
    Wait Until Element Is Visible                   ${loginpage_field_password}
    Input Text                                      ${loginpage_field_password}         ${password}

User Can Tap Button Sign In In Login Page
    Wait Until Element Is Visible                   ${loginpage_button_login}
    Click Element                                   ${loginpage_button_login}