*** Settings ***
Resource    keyword/Keyword.robot


*** Test Cases ***
TC0201 Test add operation
   # 1) prepare test data

   ${x}=    Set Variable   5
   ${y}=    Set Variable   6
  ${expected result}=   Set Variable    11
   # 2) execute Test
   ${actual result}=   Evaluate    ${x}+${y}

   #3
   Should Be Equal As Integers   ${actual result}   ${expected result}

TC0202 Test Subtract operation

   ${x} =   Set Variable  6
   ${y} =   Set Variable  5
   ${expected result}=   Set Variable    1
   ${result}=  do subtract operation    ${x}   ${y}
   Should Be Equal As Integers  ${result}  ${expected result}

TC203 Test multiply operation data driven
   [Template]  do test multiply operation
    3    4    12
    6    4    24

TC204 Test divide operation gherkins style
    Given x is 2 and y is 2
    When user press divide button
    Then screen should show 1

*** keywords ***
x is ${x} and y is ${y}
    Set Test Variable  ${x}
    Set Test Variable  ${y}

user press divide button
    #log    do  when
    ${actual result}=  Evaluate   ${x}/${y}
    Set Test Variable   ${actual result}

screen should show ${expected result}
    Should Be Equal As Integers   ${actual result}    ${expected result}
  
