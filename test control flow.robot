*** Test Cases ***
TC301 test if condition
    ${x}=   Set Variable  10
    Run Keyword If   ${x}>10    Log    x is greater than  10
    ...  ElSE IF     ${x}==10     Log     x is equal 10
    ...  ELSE   log   x is less than 10

    Run Keyword If    ${x}>10    Run Keywords    Log    1111
    ...    AND    Log    2222
    ...    AND    Log    3333
    ...    AND    Log    4444
    ...    ELSE    Log    x is less than 10
    ${hello}=    Set Variable    hello
#    Run Keyword If    $hello=='Hel\\'o'    log    string is Equal
#    ...    ELSE    Log    string is not equal

    Run Keyword If    $hello=='hello'   log    string is Equal
    ...    ELSE    Log    string is not equal

TC0302 test for loop
    ${sum} =    Set Variable     0
    :FOR    ${i}    IN RANGE    1    10
         log    i=${i}
         ${sum}=    Evaluate    ${sum}+${i}
    END
    log    sum=${sum}

TC0303 test continue exit for loop
    FOR    ${i}    IN RANGE    1    10
        Continue For Loop If    ${i}%2==0     #เงื่อนไขเป็นจริง
        Exit For Loop If    ${i}>8
        log    i=${i}
    END

TCF0304 test nested for Loop
    # for i = 1 to 10
    #  for j = 1 to 10
    #   sum < =i*j
     ${sum all}=    Set Variable  0
    FOR    ${i}    IN RANGE    1    10

       ${sum} =  do nested for loop ${i}
        ${sum all}=    Evaluate    ${sum all} + ${sum}
    END
    log    sumall=${sum all}

*** Keywords ***

do nested for loop ${i}
    ${sum}=    Set Variable  0
    FOR    ${j}    IN RANGE    1    10
        log    i=${i},j=${j}
        ${sum}=    Evaluate    ${sum}+(${j}*${i})
    END
    Return From Keyword    ${sum}







