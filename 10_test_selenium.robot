*** Settings ***
Library  SeleniumLibrary
Test Teardown  close all browsers


*** Test Cases ***
TC0901 test SeleniumLibrary
    Open Browser    about:blank    chrome
    Go To            https://robotframework.org/#libraries

TC0902 test online calculator
   Open Browser    http://www.math.com/students/calculators/source/basic.htm    chrome
   Click Element    three
   Click Element    plus
   Click Element    three
   Click Element    DoIt
   ${result}=  Get Value    Input
   should be equal as integers  ${result}    6
   










