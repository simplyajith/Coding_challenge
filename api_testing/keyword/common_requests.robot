*** Settings ***
Library  RequestsLibrary
Library  Collections
#Library  JSONLibrary


*** Variables ***



*** Keywords ***

get request for
    #    resource_url is the argument needed for get request
    #    Ex: Get requests /api/onboarding-type/
    #    /api/onboarding-type/ is the resource_url we are parsing in this keyword.

    [Arguments]  ${site}  ${resource_url}
    log to console  ${resource_url}
    ${response}=  run keyword if  "${site}" == "placeholder"   get request  ${Login.session}  ${resource_url}   headers=${HEADER_COMMON}
    [Return]  ${response}

post request for

#    resource_url, data -two arguments for post requests
#    resource_url - url of the resource where we are posting . Ex: /api/token
#    data - is the data of post requests

    [Arguments]  ${site}  ${resource_url}  ${data}=None
    log to console  ${resource_url}
    ${response}=  run keyword if  "${site}" == "placeholder"  post request  ${Login.session}  ${resource_url}  data=${data}  headers=${HEADER_COMMON}
    [Return]  ${response}

put request for

#    resource_url, data -two arguments for put  requests
#    resource_url - url of the resource where we are posting . Ex: /api/token
#    data - is the data of post requests, generally a dictionary.

    [Arguments]  ${site}  ${resource_url}  ${data}
    log to console  ${resource_url}
    ${response}=  run keyword if  "${site}" == "placeholder"  put request  ${Login.session}  ${resource_url}  data=${data}  headers=${HEADER_COMMON}
    [Return]  ${response}

patch request for

#    resource_url, data -two arguments for patch requests

    [Arguments]  ${site}  ${resource_url}  ${data}
    log to console  ${resource_url}
    ${response}=  run keyword if  "${site}" == "placeholder" patch request  ${Login.session}  ${resource_url}  data=${data}  headers=${HEADER_COMMON}
    [Return]  ${response}

delete request for
    [Arguments]  ${site}  ${resource_url}  ${data}=None
    log to console  ${resource_url}
    ${response}=  run keyword if  "${site}" == "placeholder"  delete request  ${Login.session}  ${resource_url}  data=${data}  headers=${HEADER_COMMON}
    [Return]  ${response}
