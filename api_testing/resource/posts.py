__author__ = "ajith sundararaj"

from robot.api import logger
from jsonschema import validate
import jsonschema
import json


class PostKeyword:

    def verify_post_response(self, response):
        """

        :param response: /posts API response
        :return: boolean by verifying the length of the response
        """
        if len(response) >= 100:
            return True

        return False

    def get_post_id(self, response):
        """

        :param response: /posts API response
        :return: one id from response
        """
        for i in response:
            return i["id"]

    def post_payload_to_create_post(self):
        """

        :return: create post payload as json string

        """

        data = {
            "title": "foo",
            "body": "bar",
            "userId": 1
        }

        return json.dumps(data)

    def verify_added_record_response(self, payload, response):

        """

        :param payload: payload sent to create posts
        :param response: response  payload of create post API
        :return: boolean.
                 True - if payload value is same as response value
                 False  - otherwise
        """
        payload = json.loads(payload)

        return payload["title"] == response["title"] and payload["body"] == response["body"]

    def payload_to_edit_post(self, response):
        """

        :param response: get post API response
        :return: json payload with updated values
        """
        response["title"] = "abc"
        response["body"] = "xyz"
        return response

    def verify_edited_post_response(self, payload, response):
        """

        :param payload: payload sent to edit API post
        :param response: response of edit API post
        :return:
        """
        for key, value in response.items():
            if value != payload[key]:
                return False
        return True

    def verify_get_single_post(self, response):
        """

        :param response: single post API response
        :return: boolean
        """
        try:
            validate(response, {"maxItems": 1})
        except jsonschema.exceptions.ValidationError as err:
            logger.console(err)
            return False
        return True
