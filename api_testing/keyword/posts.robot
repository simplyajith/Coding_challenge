*** Settings ***
Library   posts.PostKeyword
Library  schemaverification.PostSchema
Variables  ../config/config.yaml
Resource  common_requests.robot
Resource  setup.robot

*** Variables ***



*** Keywords ***
Verify GET posts API is successful
    log to console   ${posts.valid_post_url}
    ${get_response_posts}  Verify get request is successful  placeholder  ${posts.valid_post_url}
    set suite variable  ${get_response_posts}
    [Return]  ${get_response_posts}

Verify schema for GET posts API response
    ${status}  get_posts_schema_verification  ${get_response_posts}
    log to console  ${status}
    should be equal as strings  ${status}  True


Verify GET posts returns more than 100 posts
    ${status}  verify_post_response   ${get_response_posts}
    should be equal as strings  ${status}  True

Verify GET single post API is successful
    ${response}  Verify GET posts API is successful
    ${post_id}  get_post_id  ${response}
    set suite variable  ${post_id}
    ${get_individual_response_post}  Verify get request is successful  placeholder  ${posts.valid_post_url}${post_id}
    set suite variable  ${get_individual_response_post}
    set suite variable  ${post_id}
    [Return]  ${get_individual_response_post}

Verify GET single post returns only one record
    ${status}  verify_get_single_post  ${get_individual_response_post}
    should be equal as strings  ${status}  True

Verify schema for single post API response
    ${status}  get_single_post_schema_verification  ${get_individual_response_post}
    log to console  ${status}
    should be equal as strings  ${status}  True

Verify GET invalid posts is not successful
    ${get_invalid_response_post}  Verify get request is successful  placeholder  ${posts.invalid_post_url}  404
    log to console  Invalid response is
    log to console  ${get_invalid_response_post}

Verify create a post using post API is successful
    ${payload_as_json_string}  post payload to create post
    ${create_post_response}  Verify post request is successful  placeholder  ${posts.valid_post_url}  ${payload_as_json_string}
    log to console  ${create_post_response}
    ${status}  verify added record response  ${payload_as_json_string}  ${create_post_response}
    should be equal as strings  ${status}  True
    set suite variable  ${create_post_response}

Verify schema for create posts API response
    ${status}  create_posts_schema_verification  ${create_post_response}
    should be equal as strings  ${status}  True

Verify edit post using post API is successful

    ${response}  Verify GET single post API is successful
    ${edit_post_payload}  payload to edit post  ${response}
    log to console  ${edit_post_payload}
    ${edit_post_response}  Verify put request is successful  placeholder  ${posts.valid_post_url}${post_id}  ${edit_post_payload}
    log to console  ${edit_post_response}
    ${status}   verify_edited_post_response  ${edit_post_payload}  ${edit_post_response}
    should be equal as strings  ${status}  True
    set suite variable  ${edit_post_response}

Verify schema for edit posts API response
    #using the same schema verification for single post as both the edit and single post schemas are same
    ${status}  get_single_post_schema_verification  ${edit_post_response}
    log to console  ${status}
    should be equal as strings  ${status}  True

Verify delete posts API is successful
    ${response}  Verify GET posts API is successful
    ${post_id}  get_post_id  ${response}
    set suite variable  ${post_id}
    ${single_post_url}  catenate   ${posts.valid_post_url}${post_id}
    ${delete_response_posts}  Verify delete request is successful  placeholder  ${single_post_url}
    set suite variable  ${delete_response_posts}

