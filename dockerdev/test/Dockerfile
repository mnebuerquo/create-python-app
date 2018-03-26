FROM python:3

RUN pip install --upgrade pip
RUN pip install pytest-watch pytest

COPY . /usr/test
WORKDIR /usr/src/app
ENTRYPOINT [ "sh", "/usr/test/test.sh" ]
