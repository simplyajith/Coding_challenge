*** Settings ***
Resource  common_requests.robot


*** Variables ***
${Login.session}  placeholder_session


*** Keywords ***
Variable initialisation for placeholder API
    ${HEADER_COMMON}  create dictionary  Content-Type=application/json  charset=UTF-8
    set suite variable  ${Login.session}
    set suite variable  ${BASE_URL}
    set global variable  ${HEADER_COMMON}
    create session  ${Login.session}  ${BASE_URL}

Verify get request is successful
    [Arguments]   ${site}   ${site_url}  ${code}=200
    ${response}   get request for  ${site}  ${site_url}
#    log to console  ${response.content}
    Verify Status code is expected  ${response.status_code}  ${code}
    [Return]   ${response.json()}

Verify post request is successful
    [Arguments]   ${site}   ${site_url}  ${data}  ${code}=201
    ${response}   post request for  ${site}  ${site_url}  ${data}
    Verify Status code is expected  ${response.status_code}  ${code}
    [Return]   ${response.json()}

Verify put request is successful
    [Arguments]   ${site}   ${site_url}  ${data}  ${code}=200
    ${response}   put request for  ${site}  ${site_url}  ${data}
    Verify Status code is expected  ${response.status_code}  ${code}
    [Return]   ${response.json()}

Verify Status code is expected

    [Arguments]  ${actual_code}  ${expected_code}
    ${code}=  convert to string  ${actual_code}
    should be equal  ${code}  ${expected_code}

Verify delete request is successful
    [Arguments]   ${site}   ${site_url}  ${code}=200
    ${response}   get request for  ${site}  ${site_url}
    Verify Status code is expected  ${response.status_code}  ${code}
    [Return]   ${response.json()}