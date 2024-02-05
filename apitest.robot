*** Settings ***
Library               RequestsLibrary

*** Variables ***
${message}    Doesn't recieve characters as input

*** Test Cases ***

Test 1 : 4 plus 1 should return 5
    ${response}=    GET  http://localhost:5000/plus/4/1

    Should Be Equal    ${response.status_code}    ${200}

    ${json_resp}=    Set Variable    ${response.json()}

    Should Be Equal    ${json_resp['result']}    ${5}

Test 2 : 4.2 plus 2.3 should return 6.5

    ${response}=    GET  http://localhost:5000/plus/4.2/2.3

    ${json_resp}=    Set Variable  ${response.json()}

    Should Be Equal    ${json_resp['result']}    ${6.5}

Test 3 : 2.32 plus -23 should return -20.68
    ${response}=    GET  http://localhost:5000/plus/2.32/-23

    ${json_resp}=    Set Variable  ${response.json()}

    Should Be Equal    ${json_resp['result']}    ${-20.68}

Test 4 : -2 plus -7 should return -9

    ${response}=    GET  http://localhost:5000/plus/-2/-7 

    ${json_resp}=    Set Variable  ${response.json()}

    Should Be Equal    ${json_resp['result']}    ${-9}

Test 5 : 2 plus a should return "Doesn't recieve characters as input"
    ${response}=    GET  http://localhost:5000/plus/2/a

    Should Be Equal As Strings    ${response.json()['result']}    ${message}
