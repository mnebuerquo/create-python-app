FROM python:3

RUN pip install --upgrade pip
RUN pip install pytest

WORKDIR /usr/src/app
COPY ./requirements.txt ./requirements.txt
RUN pip install -r requirements.txt

ENTRYPOINT [ "pytest", "--doctest-modules" ]
