*** Settings ***
Library   RequestsLibrary
Library    Collections

*** Variable ***
${link}   http://dummy.restapiexample.com

*** Test Case ***

TC0802 test dummy api

    ${employee}=   Create Dictionary   name=Panida   age=23   salary=2000
    ${headers}=   Create Dictionary   Content-Type=application/json   User-Agent=${EMPTY}
    Create Session   dummy   ${link}   headers=${headers}
    # 1) check if name exits -> delete it
    check if name exits   ${employee}[name]
    # 2) add employee then get id
    ${employee}=   add employee  ${employee}
    # 3) check if the employee in system
    validate employee  ${employee}
    # 4) update salary
    Set To Dictionary   ${employee}   salary=50000
    ${employee}=   update employee  ${employee}
    # 5) check if salary change
    validate employee  ${employee}
    # 6) deltet the employee
    delete the employee by id  ${employee}[id]

*** Keywords ***

check if name exits
    [Arguments]   ${name}
    ${response}=   Get Request   dummy   /api/v1/employees
    ${json}=   Set Variable   ${response.json()}
    FOR   ${i}   IN   @{json}
        ${id}=   Set Variable   ${i}[id]
        ${emp_name}=   Set Variable   ${i}[employee_name]

        Continue For Loop If   $emp_name!=$emp_name[name]
        delete the employee by id   ${id}
        Exit For Loop
    END

delete the employee by id
    [Arguments]   ${id}
    ${response}=   Delete Request   dummy   /api/v1/delete/${id}
    Should Be Equal As Integers   ${response.status_code}   200

add employee
    [Arguments]   ${employee}
    ${data}=    Evaluate    json.dumps($employee)    modules=json
    ${response}=   Post Request   dummy   /api/v1/create   data=${data}
    ${json}=   Set Variable   ${response.json()}
    Set To Dictionary   ${employee}   id=${json}[id]
    Run Keyword If   $employee['id']!=''   log   add new employee successfully!
    ...   ELSE   log   add new employee fail!
    Return From Keyword   ${employee}

update employee
    [Arguments]   ${employee}
    ${data}=    Evaluate    json.dumps($employee)    modules=json
    ${response}=   Put Request   dummy   /api/v1/update/${employee}[id]   data=${data}
    ${json}=   Set Variable   ${response.json()}
    Set To Dictionary   ${employee}   salary=${json}[salary]
    Run Keyword If   $employee['salary']!=''   log   update successfully!
    ...   ELSE   log   update fail!
    Return From Keyword   ${employee}

validate employee
    [Arguments]   ${employee}
    ${response}=   Get Request   dummy   /api/v1/employee/${employee}[id]
    ${json}=   Set Variable   ${response.json()}
    Should Be Equal As Integers   ${response.status_code}   200
    Should Be Equal As Integers   ${json}[id]   ${employee}[id]
    Should Be Equal As Strings   ${json}[employee_name]   ${employee}[name]
    Should Be Equal As Integers   ${json}[employee_age]   ${employee}[age]
    Should Be Equal As Integers   ${json}[employee_salary]   ${employee}[salary]