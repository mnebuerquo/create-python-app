FROM python:3

WORKDIR /usr/src/app

COPY . /usr/lint

RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r /usr/lint/requirements.txt

ENTRYPOINT ["flake8", "--append-config=/usr/lint/flake8.ini"]
