*** Settings ***
Documentation   Login Page - Functional Test 
Resource        ../Resources/loginKeywords.robot
Test Setup     Open Browser Chrome
Test Teardown  Close Browser

*** Variables ***
@{userNames}        standard_user       locked_out_user     problem_user        performance_glitch_user
&{userName}         invalid=standarduser
&{passWord}         valid=secret_sauce      invalid=secretsauce 

*** Test Cases ***

Login with invalid username and invalid password
    [Tags]  Negative Test
    Go To SwagLab Page
    Input Username                  ${userName.invalid}
    Input Password                  ${passWord.invalid}
    Click Login Button
    Show Error Not Found User Message

Login with valid username and invalid password
    [Tags]  Negative Test
    Go To SwagLab Page
    Input Username                  ${userNames}[1]
    Input Password                  ${passWord.invalid}
    Click Login Button
    Show Error Not Found User Message 

Login with invalid username and valid password
    [Tags]  Negative Test
    Go To SwagLab Page
    Input Username                  ${userName.invalid}
    Input Password                  ${passWord.valid}
    Click Login Button
    Show Error Not Found User Message 

Login without fill in username and password
    [Tags]  Negative Test
    Go To SwagLab Page
    Click Login Button
    Show Error Username Message 

Login with valid username but without password
    [Tags]  Negative Test
    Go To SwagLab Page  
    Input Username                  ${userNames}[1]
    Click Login Button
    Show Error Password Message

Login without username but valid password
    [Tags]  Negative Test
    Go To SwagLab Page
    Input Password                  ${passWord.valid}    
    Click Login Button              
    Show Error Username Message 

Login with locked_out_user and valid password
    [Tags]  Negative Test
    Go To SwagLab Page
    Input Username                  ${userNames}[1]
    Input Password                  ${passWord.valid}
    Click Login Button
    Show Error Locked Out User Message 


Login with valid username1 and valid password
    [Tags]  Positive Test
    Go To SwagLab Page
    Input Username                  ${userNames}[0]
    Input Password                  ${passWord.valid}
    Click Login Button
    Show Dashboard

Login with valid username3 and valid password
    [Tags]  Positive Test
    Go To SwagLab Page
    Input Username                  ${userNames}[2]
    Input Password                  ${passWord.valid}
    Click Login Button
    Show Dashboard

Login with valid username4 and valid password
    [Tags]  Positive Test
    Go To SwagLab Page
    Input Username                  ${userNames}[3]
    Input Password                  ${passWord.valid}
    Click Login Button
    Show Dashboard