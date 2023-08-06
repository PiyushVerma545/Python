*** Settings ***
Documentation    To validate the login form
Library    SeleniumLibrary

*** Variables ***
${user_name}  rahulshettyacademy
${invalid_password}   1234
${valid_password}   learning


*** Keywords ***
open the browser with Mortage payment url
    Create Webdriver    Chrome   C:\Users\Swapnil\Downloads\chromedriver_win32
    Go To    https://rahulshettyacademy.com/loginpagePractise/

close Browser session
    Close Browser