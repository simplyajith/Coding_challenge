from pathlib import Path
import sys
from os.path import dirname
import os
import yaml
from robot.api import logger


def load_config(config):
    """

    :param config: path of config file
    :return:  safeloads the configured yaml file
    """
    with open(config, 'r') as stream:
        try:
            return yaml.safe_load(stream)
        except yaml.YAMLError as exc:
            print(exc)


def get_project_root():
    """Returns project root folder."""
    return Path(__file__).parent.parent


def initiate_config():
    """
    utlility function to load configuration file
    :return: None
    """
    root_dir = get_project_root()
    logger.console(root_dir)
    config_file = os.path.join(root_dir, 'config/config.yaml')
    load_config(config_file)


def set_sys_path():
    """
    1) Appends the python files directory of the project(resource) to system path
    2) Appends the root directory of the project(api_testing) to system path
    :return: None
    """
    resources_path = dirname(os.path.abspath(__file__))
    sys.path.append(resources_path)
    resource_parent_path = dirname(resources_path)
    sys.path.append(resource_parent_path)
