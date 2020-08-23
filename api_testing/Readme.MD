
Prerequisites:
Python
Python-pip

Windows:

pip install virtualenv

python -m venv venv

cd venv/Scripts

activate

After activating the virtual environment. go back to api_testing folder

cd api_testing

pip install -r requirements.txt


python -m robot --variable BASE_URL:https://jsonplaceholder.typicode.com -d results/smoke --loglevel DEBUG -i smoke tests