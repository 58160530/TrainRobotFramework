*** Settings ***
Library  RequestsLibrary
Documentation    Suite description
Library  String

*** Test Cases ***
TC01 update
    create session     dummy   http://dummy.restapiexample.com
    ${header}=     create dictionary  User-Agent=${EMPTY}    content-type=application/json
    ${employee}=    create dictionary  id=59409  name=poy20
     ${body}=    evaluate    json.dumps($employee)    modules=json
    ${response}=    Put request    dummy   api/v1/update/${employee}[id]  headers=${header}    data=${body}

    ${json}=   Set Variable   ${response.json()}












