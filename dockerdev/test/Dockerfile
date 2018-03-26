FROM python:3

#ARG PROJECT

WORKDIR /usr/src/app

COPY . /usr/test

RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r /usr/test/requirements.txt

# if project is set, copy requirements.txt from there, else from current
#COPY ${PROJECT:-xxxxxx}/requirements.txt /usr/src/app/requirements.txt
#RUN pip install --no-cache-dir -r /usr/src/app/requirements.txt

ENTRYPOINT [ "sh", "/usr/test/test.sh" ]
