# API testing using Python-Robot framework

API testing of web application [jsonplaceholder](https://jsonplaceholder.typicode.com)

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

What things you need to install the software and how to install them

```
git
python3
python3 in system path
pip3
```

### Installation

##Mac OS 
```
git clone https://github.com/simplyajith/Coding_challenge.git
cd Coding_challenge/
pip install virtualenv
python3 -m venv venv
source venv/bin/activate
cd api_testing/
pip install -r requirements.txt 
robot  --variable BASE_URL:https://jsonplaceholder.typicode.com -d results/smoke --loglevel DEBUG -i smoke tests

```

##Windows

```
git clone https://github.com/simplyajith/Coding_challenge.git
cd Coding_challenge/
pip install virtualenv
python -m venv venv
cd venv/Scripts
activate

#After activating the virtual environment. go back to api_testing folder
cd api_testing
pip install -r requirements.txt
python -m robot --variable BASE_URL:https://jsonplaceholder.typicode.com -d results/smoke --loglevel DEBUG -i smoke tests
```

##Docker

Clone the repo and go to Coding_challenge directory
```
git clone https://github.com/simplyajith/Coding_challenge.git
cd Coding_challenge/api_testing
```

Run the docker compose file
```
docker-compose up  --build
```

## Test results
HTML output will be present in the results folder.

## Built With

* [Python3](https://www.python.org/download/releases/3.0/) - Language used
* [Robot Framework](https://robotframework.org/) - The test framework used
* [Jsonschema](https://www.jsonschema.net/login) - Used to generate schema

## Authors

* **Ajith Sundararaj** - *Initial work* - [simplyajith](https://github.com/simplyajith)

