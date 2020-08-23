import json
import jsonschema
from jsonschema import validate
from robot.api import logger


class BaseSchemaVerification:

    @staticmethod
    def schema_verification(response, filename):
        """
        :param response: API response which needs to be validated
        :param filename: filename of the schema present in schema folder, used to validate against the API response
        :return: True if validation is successful, False, if validation failed due to validation error and schema error
        If validation is failed, complete logs will be printed in the console for  troubleshooting
        """
        try:
            with open(filename, "r") as f:
                data = json.load(f)
            validate(instance=response, schema=data)
        except jsonschema.exceptions.ValidationError as err:
            logger.console(err)
            return False
        except jsonschema.exceptions.SchemaError as err:
            logger.console(err)
            return False
        return True


class PostSchema(BaseSchemaVerification):
    """
    All the response of Post API will be verified in this class.
    """

    def get_posts_schema_verification(self, response):
        return self.schema_verification(response, "schema/posts_schema.json")

    def get_single_post_schema_verification(self, response):
        return self.schema_verification(response, "schema/single_post_schema.json")

    def create_posts_schema_verification(self, response):
        return self.schema_verification(response, "schema/create_post_schema.json")
