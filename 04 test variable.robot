*** Settings ***
Library    Collections
variables    ../resources/data.yaml
variables    ../resources/${ENV}/config.yaml

*** variable ***
${ystr}    hello
${yint}    ${10}
${yfloat}    ${3.5}
${list2}    100    200    300    400
${dict2}    a=100    b=200    c=300    d=400

*** test cases ***
TC0401 test scalar variable
    ${xstr}=    Set Variable    hello
    ${xint}=    Set Variable    ${0}
    ${xfloat}=    Set Variable    ${2.3}

TC0402 test list variables
    ${list1}=    Create List    100    200    300    300   ${300}    400

    # access an item
    log    ${list1}
    Log List    ${list1}
    log    ${list1}[1]
    log    ${list1[1]}
    # access sub list
    log    ${list1}[1:5]
    log    ${list1}[1:]
    log    ${list1}[1:-1]
    log    ${list1}[1:-2]
    log    ${list1}[-3:]

    Append To List    ${list1}    500    ${600}
    log    ${list1}

    Insert Into List    ${list1}    2    250
    log    ${list1}

    Remove From List    ${list1}    4
    log    ${list1}

    # loop by get length
    ${len}=    Get Length    ${list1}
    FOR    ${i}    IN RANGE    0    ${len}
        log    i=${i}, value=${list1}[${i}]
    END
    # loop by iterator
    FOR    ${item}    IN    @{list1}
        log    value=${item}
    END

 TC0403 test dictionary variable
    ${dict1}=    Create Dictionary    a=100    b=200    c=${300}    d=400    e=500    b=222

    log    ${dict1}
    Log Dictionary    ${dict1}

    # access an item
    log    ${dict1}[d]
    log    ${dict1['d']}

    Set To Dictionary    ${dict1}    f=600    g=700    a=111    bb=250
    log    ${dict1}

    Remove From Dictionary    ${dict1}    d    e
    log    ${dict1}

    # for loop
    FOR    ${key}    IN    @{dict1}
        log    key=${key}, value=${dict1}[${key}]
    END

    FOR    ${key}    ${value}    IN ZIP    ${dict1.keys()}    ${dict1.values()}
        log    key=${key}, value=${value}
    END


TC0404 test nested structure
    # 2 dimensions list
    ${sublist1}=    create list    11    12    13    14
    ${sublist2}=    create list    21    22    23    24
    ${sublist3}=    create list    31    32    33    34
    ${sublist4}=    create list    41    42    43    44
    ${mainlist}=    create list    ${sublist1}    ${sublist2}    ${sublist3}    ${sublist4}
    log list    ${mainlist}
    log    ${mainlist}[2][3]

    # dict of dict
    ${subdict1}=    create dictionary    a=11    b=12    c=13    d=14
    ${subdict2}=    create dictionary    a=21    b=22    c=23    d=24
    ${subdict3}=    create dictionary    a=31    b=32    c=33    d=34
    ${subdict4}=    create dictionary    a=41    b=42    c=43    d=44
    ${maindict}=    create dictionary    dict1=${subdict1}    dict2=${subdict2}    dict3=${subdict3}    dict4=${subdict4}
    log dictionary    ${maindict}
    log    ${maindict}[dict3][c]

    # hybrid
    ${subdict1}=    create dictionary    a=11    b=12    c=13    d=14
    ${subdict2}=    create dictionary    a=21    b=22    c=23    d=24
    ${subdict3}=    create dictionary    a=31    b=32    c=33    d=34
    ${subdict4}=    create dictionary    a=41    b=42    c=43    d=44

    ${sublist1}=    create list    100    200
    ${sublist2}=    create list    ${subdict3}    ${subdict4}

    ${maindict}=    create dictionary    item1=ITEM1    item2=${subdict1}    item3=${subdict2}    item4=${sublist1}    item5=${sublist2}

TC0405 test get data from yaml file
    log    ${string}
    log    ${integer}
    log    ${list}[1]
    log    ${dict}[two]

 TC0406 test get data from command line
    log    ${cmdvar}
    log    i'm using username ${username}
