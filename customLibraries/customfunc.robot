*** Test Cases ***
*** Settings ***
Documentation    To validate the login form
Library    SeleniumLibrary
Library     Collections
Library     String
Library     Shop.py
Test Setup    open the browser with Mortage payment url
Test Teardown  Close Browser Session
Resource    resource.robot

*** Variables ***
${Error_Message_Login}      css:.alert-danger
${Shop_page_load}           css:.nav-link
@{listofProducts}       Blackberry      Nokia Edge


*** Test Cases ***
Validate Unsuccesful Login
    Fill the login form     ${user_name}  ${invalid_password}
    wait until Element is located in the page   ${Error_Message_login}
    verify error message is correct

Validate Cards display in the Shopping Page
    Fill the login form     ${user_name}    ${valid_password}
    wait until Element is located in the page   ${Shop_page_load}
   # verify Card titles in the shop page
  Add Items To Cart And Checkout         $(listofProducts)


Select the Form and navigate to Child window
        Fill the Login Details and Login Form


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

verify Card titles in the shop page
#first time create list with @
    @{expectedList}=    Create List    iphone X   Samsung Note 8   Nokia Edge    Blackberry
    ${elements}=   Get WebElements     css:.card-title
    @{actualList}=      Create List
    FOR    ${element}   IN  ${elements}
       # Log     ${element.text}
        Append To List     ${actualList}    ${element.text}

    END
    Lists Should Be Equal   ${expectedList}   ${actualList}

    # once created list with @ , then only use $


Select the Card
#argument taught in tutorial correct is Argument
    [Arguments]     ${cardName}
    ${elements}=   Get WebElements     css:.card-title
    ${index}=     Set Variable    1
    FOR    ${element}   IN  ${elements}
       Exit For Loop If    '${cardName}' == '${elements.text}'
       ${index}=    Evaluate    ${index}+1
    END
    Click Button    xpath:(//*[@class='card-footer'])[${index}]/button

Fill the Login Details and Login Form
    Input Text    id:username     rahulshettyacademy
    Input Password   id:password     learning
    Click Element    css:input[value='user']
    #Wait Until Element Is Visible   okayBtn
    Wait Until Element Is Visible  css:.modal-body
    #Click Element    okayBtn
    Click Button     id:okayBtn
    Click Button     id:okayBtn
    Wait Until Element Is Not Visible   css:.modal-body
    Select From List By Value    css:select.form-control    teach
    Select Checkbox    terms
    Checkbox Should Be Selected    terms

