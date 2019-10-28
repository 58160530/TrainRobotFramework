*** Settings ***
Library    Collections



*** Variables ***
${ystr}    hello
${yint}    ${10}
${yfloat}    ${3.5}
${list2}

*** Test Cases ***
TC0401 test scalar variables
    ${xstr}=    Set Variable    hello
    ${xint}=    Set Variable    ${0}
    ${xfloat}=    Set Variable    ${2.3}

TC0402 test list variables
    ${list1}=    Create List    100    200    300    300    ${300}    400

#    log    ${list1}
#    Log list    ${list1}
#    log    ${list1}[1]

    log    ${list1}[1:3]
    log    ${list1}[1:]
    log    ${list1}[1:-1]
    log    ${list1}[1:-2]



    Append To List    ${list1}    500    ${600}  #ใส่ต่อท้าย
    log    ${list1}


    Insert Into List    ${list1}    2    250  #ต้องบอก index ด้วย
    log    ${list1}


    Remove From List    ${list1}    4
    log    ${list1}

    ${len}=    Get Length    ${list1}
    FOR    ${i}    IN RANGE    0    ${len}
        log    value=${i},value=${list1}[${i}]

    END

    FOR    ${item}    IN    @{list1}
        log    value=${item}

    END

TC0403 test dictionary variable
    ${dict1}=    Create Dictionary    a=100    b=200    c=${300}    d=400    e=500    b=222

    log    ${dict1}
    Log Dictionary    ${dict1}

    log    ${dict1}[d]
    log    ${dict1['d']}

    Set To Dictionary    ${dict1}    f=600    g=700    a=111    bb=250
    log    ${dict1}

    Remove From Dictionary    ${dict1}    d     e
    log    ${dict1}


    FOR    ${key}    IN    @{dict1}
        log    key=${key}, value=${dict1}[${key}]

    END

    FOR    ${key}    ${value}    IN ZIP    ${dict1.keys()}    ${dict1.values()}
        log    key=${key}, value=${value}
    END