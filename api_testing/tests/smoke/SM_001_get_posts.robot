*** Settings ***
Resource  ../../keyword/setup.robot
Resource  ../../keyword/posts.robot


*** Variables ***



*** Test Cases ***
Verify GET posts API is successful
    [Documentation]  Verify GET posts API is successful
    [Tags]  smoke
    [Setup]  Variable initialisation for placeholder API
    Verify GET posts API is successful


Verify schema for GET posts API response
    [Documentation]  Verify schema for single post API response
    [Tags]  smoke
    Verify schema for GET posts API response

Verify GET posts returns more than 100 posts
    [Documentation]  Verify GET posts returns more than 100 posts
    [Tags]  smoke
    Verify GET posts returns more than 100 posts

Verify GET single post API is successful
    [Documentation]  Verify GET single post API is successful
    [Tags]  smoke
    Verify GET single post API is successful

Verify schema for single post API response
    [Documentation]  Verify schema for single post API response
    [Tags]  smoke
    Verify schema for single post API response

Verify GET single post returns only one record
    [Documentation]  Verify GET single post returns only one record
    [Tags]  smoke
    Verify GET single post returns only one record

Verify GET invalid posts is not successful
    [Documentation]  Verify GET invalid posts is not successful
    [Tags]  smoke
    Verify GET invalid posts is not successful
