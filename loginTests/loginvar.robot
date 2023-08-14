*** Settings ***
Documentation    To validate the login form
Library    SeleniumLibrary
Test Setup    open the browser with Mortage payment url
Test Teardown  Close Browser Session
Resource    resource.robot

*** Variables ***
${Error_Message_Login}      css:.alert-danger
${Shop_page_load}           css:.nav-link

*** Test Cases ***
Validate Unsuccesful Login
    Fill the login form     ${user_name}  ${invalid_password}
    wait until Element is located in the page   ${Error_Message_login}
    verify error message is correct

Validate Cards display in the Shopping Page
    Fill the login form     ${user_name}    ${valid_password}
    wait until Element is located in the page   ${Shop_page_load}


*** Keywords ***
Fill the login form
    [Arguments]     ${user_name}     ${password}
    Input Text    id:username   ${user_name}
    Input Password   id:password   ${password}
    Click Button    signInBtn

wait until Element is located in the page
    [Arguments]    ${element}
    Wait Until Element Is Visible  ${element}


verify error message is correct
    ${result}=  Get Text    css:.alert-danger       #here we can use${Error_Message_Login} variable
    Should Be Equal As Strings    ${result}  Incorrect username/password.
    Element Text Should Be    ${Error_Message_Login}  Incorrect username/password.