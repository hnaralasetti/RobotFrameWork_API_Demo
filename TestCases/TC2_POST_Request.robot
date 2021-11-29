*** Settings ***
Library  RequestsLibrary
Library  Collections

*** Variables ***
${base_url}     https://reqres.in/api

*** Test Cases ***
put_EmployeeRegistration
    create session      mysession   ${base_url}
    ${body}=     create dictionary  name=Prasad  job=Tester   id=23
    ${header}=      create dictionary  Content-Type=application/json
    ${response}=  post request   mysession   /users      data=${body}    headers=${header}

    log to console  ${response.status_code}
    log to console  ${response.content}

    #Validation
    ${status_code}=     convert to string  ${response.status_code}
    should be equal     ${status_code}      201


    ${res_body}=    convert to string  ${response.content}
    should contain     ${res_body}      Prasad
    should contain     ${res_body}      Tester
    should contain     ${res_body}      23