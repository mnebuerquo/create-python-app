FROM python:3

WORKDIR /usr/src/app

COPY . /usr/src/app

RUN pip install --upgrade pip
RUN pip install pytest
RUN pip install -r requirements.txt

ENTRYPOINT [ "pytest", "--doctest-modules" ]
