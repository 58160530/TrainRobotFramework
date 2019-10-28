*** Settings ***
Library   OperatingSystem

*** Test Cases ***
TC0601 test create json from file
    ${content}=     Get File    ${CURDIR}/resource/test data.json


TC0602 test create data from template file
    ${content}=    Get File    ${CURDIR}/resource/test data.json
    ${name}=    Set Variable   Mason
    ${age}=    Set Variable    70
    ${sex}=    Set Variable    male
    ${final content}=    Replace Variables   ${content}
    log    ${final content}

TC0603 test create json at runtime
    ${friend1}=    Create Dictionary    name=Marry    age=${30}
    ${friend2}=     Create Dictionary    name=David    age=${32}
    ${friends}=     Create List    ${friend1}    ${friend2}

    ${maindict}=    Create Dictionary    name=John    age=${34}    sex=mail
    log    ${maindict}
    ${json}=    Evaluate    json.dumps($maindict)    modules=json
    log    ${json}

TC0604 test create json hybrid

    ${content}=    Get File    ${CURDIR}/resource/test datatemplate.json
    ${name}=    Set Variable   Mason
    ${age}=    Set Variable    70
    ${sex}=    Set Variable    male

       ${friend1}=    Create Dictionary    name=Marry    age=${30}
    ${friend2}=     Create Dictionary    name=David    age=${32}
    ${friends}=     Create List    ${friend1}    ${friend2}




