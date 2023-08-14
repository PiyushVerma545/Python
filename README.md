# Robot Framework Implementation...

Implemented Robotframework basic test cases.

Invoked browsers for web automation using driver.

Declared variables in robot file for global use.

Used Resource file/Keywords to overcome reusable code.

Send arguments to keywords from the test and from the variable.
 
*** Settings ***
Description for TestCase
Add library to be used 

*** Variables ***
Declare variables

*** TestCases ***
Test Cases to be performed 

*** Keywords ***
Test scripts for individual testcases.

*****************************************
Run: file_name.robot robot
**********************************
logs: copy absolute path for log.html and open in browser.
****************************************

