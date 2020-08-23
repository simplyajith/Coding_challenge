*** Settings ***
Resource  ../../keyword/setup.robot
Resource  ../../keyword/posts.robot


*** Variables ***



*** Test Cases ***
Verify delete posts API is successful
    [Documentation]  Verify GET posts API is successful
    [Tags]  smoke   delete
    Verify delete posts API is successful

