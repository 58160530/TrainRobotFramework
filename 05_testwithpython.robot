*** Settings ***
Library    helper.py

*** Test Cases ***
TC0501 test call python keyword
    mykeyword2    "Test"


TC502 test call python sum list
    ${sum}=    calculate sum list    ${10}    ${10}

TC503 test call python inline
    ${result}=    Evaluate    random.randint(1,10)    modules=random



