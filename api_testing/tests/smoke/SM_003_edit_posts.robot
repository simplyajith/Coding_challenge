*** Settings ***
Resource  ../../keyword/setup.robot
Resource  ../../keyword/posts.robot


*** Variables ***



*** Test Cases ***
Verify edit post using post API is successful
    [Documentation]  Verify GET posts API is successful
    [Tags]  smoke  edit
    Verify edit post using post API is successful

Verify schema for edit posts API response
    [Documentation]  Verify schema for single post API response
    [Tags]  smoke  edit
    Verify schema for edit posts API response
