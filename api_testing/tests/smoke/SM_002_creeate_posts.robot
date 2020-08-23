*** Settings ***
Resource  ../../keyword/setup.robot
Resource  ../../keyword/posts.robot


*** Variables ***



*** Test Cases ***
Verify create a post using post API is successful
    [Documentation]  Verify GET posts API is successful
    [Tags]  smoke  create
    Verify create a post using post API is successful

Verify schema for create posts API response
    [Documentation]  Verify schema for single post API response
    [Tags]  smoke  create
    Verify schema for create posts API response