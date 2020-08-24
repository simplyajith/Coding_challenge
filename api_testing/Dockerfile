FROM python
#RUN ln -sf /bin/bash /bin/sh

#update the image
# RUN apt-get update

ENV PYTHONWARNINGS "ignore:Unverified HTTPS request"
#install python
# RUN apt install -y python3
# RUN apt install -y python3-pip

COPY requirements.txt .
RUN pip3 install -r requirements.txt

#Robot specifi
RUN mkdir /config
RUN mkdir /keyword
RUN mkdir /resource
RUN mkdir /results
RUN mkdir /schema
RUN mkdir /tests

ENTRYPOINT ["robot"]
#CMD robot  --variable BASE_URL:https://jsonplaceholder.typicode.com -d results --loglevel DEBUG -i smoke tests
