*** Settings ***
Library                             SeleniumLibrary
Variables                           locatorLogin.yaml

*** Variables ***
${login_url}                        https://saucedemo.com/

*** Keywords ***
Open Browser Chrome
    Open Browser                    browser=chrome
    Maximize Browser Window

Go To SwagLab Page
    Go To                           ${login_url}

Input Username
    [Arguments]                     ${username}
    Input Text                      ${username_textbox}         ${username}

Input Password
    [Arguments]                     ${password}    
    Input Text                      ${password_textbox}         ${password}

Click Login Button
    Click Element                   ${login_button}

Show Dashboard
    Element Text Should Be          ${dashboard_check}      PRODUCTS

Show Error Not Found User Message
    Element Text Should Be          ${error_message}        Epic sadface: Username and password do not match any user in this service

Show Error Username Message 
    Element Text Should Be          ${error_message}        Epic sadface: Username is required

Show Error Password Message 
    Element Text Should Be          ${error_message}        Epic sadface: Password is required

Show Error Locked Out User Message 
    Element Text Should Be          ${error_message}        Epic sadface: Sorry, this user has been locked out.