*** Settings ***
Documentation    To validate the login form
Library    SeleniumLibrary
Test Teardown  Close Browser
Test Template    Validate Unsuccesful Login

*** Variables ***
${Error_Message_Login}      css:.alert-danger

*** Test Cases ***          username           password
Invalid username            dashed              learning
Invalid password            rahulshetty         ploudfg
special characters          @#$                 learning

*** Keywords ***
Validate Unsuccesful Login
    [Arguments]      ${username}        ${password}
    open the browser with Mortage payment url
    Fill the login form      ${username}        ${password}
    wait until it checks and display error message
    verify error message is correct

open the browser with Mortage payment url
    Create Webdriver    Chrome   C:\Users\Swapnil\Downloads\chromedriver_win32
    Go To    https://rahulshettyacademy.com/loginpagePractise/

Fill the login form
    [Arguments]      ${username}   ${password}
    Input Text       id:username   ${username}
    Input Text       id:password   ${password}
    Click Button    signInBtn

wait until it checks and display error message
    Wait Until Element Is Visible    css:.alert-danger

verify error message is correct
    ${result}=  Get Text    css:.alert-danger       #here we can use${Error_Message_Login} variable
    Should Be Equal As Strings    ${result}  Incorrect username/password.
    Element Text Should Be    ${Error_Message_Login}  Incorrect username/password.