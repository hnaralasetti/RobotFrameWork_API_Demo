*** Settings ***
Library  RequestsLibrary
Library  Collections

*** Variables ***
${base_url}     https://reqres.in
${page}  2


*** Test Cases ***
Get_Record
    create session  myssion     ${base_url}
    ${response}=    get on session  myssion   url=/api/users?page=${page}

    log to console  ${response.status_code}
    log to console  ${response.content}
    log to console  ${response.headers}

#Validation

    ${status_code}=    convert to string  ${response.status_code}
    should be equal     ${status_code}      200

    ${body}=     convert to string   ${response.content}
    should contain  ${body}     Lawson

    ${contentTypeValue}=    get from dictionary  ${response.headers}     Content-Type
    should be equal  ${contentTypeValue}    application/json; charset=utf-8