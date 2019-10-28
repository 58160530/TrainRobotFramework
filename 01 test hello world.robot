*** Settings ***
Documentation    Suite description

*** Variables ***

${Thomas}   Thomas

*** Test Cases ***
TC010 test hello world
    [tags]  regression  sprint1
    Log    hello world
    Log To Console  Hello world on console


TC002 test hello friend
    hello friend  John

TC003 test hello many friends
    hello many friends  John  Mary  ${thomas}
    hello many friends  John
    hello many friends  friend3=John  friend1=Mary  friend2=${Thomas}
    hello many friends  John   friend3=Donald

TC004 test hello by get my friends
    [tags]  sprint2
    ${friend1}   ${friend2}    ${friend3}=   get my friends
    log    hello by get my friends ${friend1},${friend2} and ${friend3}




*** Keywords ***
hello friend
   [Arguments]  ${name}
   Log    hello \ friend ${name}

hello many friends
    [Arguments]  ${friend1}  ${friend2}=Devid  ${friend3}=Mark
    log  hello my friends ${friend1},${friend2} and ${friend3}

get my friends
    Return From Keyword      John     Donald    ${Thomas}
