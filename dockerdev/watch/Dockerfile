FROM python:3

WORKDIR /usr/src/app

COPY . /usr/src/app

RUN pip install --upgrade pip
RUN pip install pytest-watch
RUN pip install -r requirements.txt

# this fails if it doesn't have an ini file
ENTRYPOINT [ "ptw", "-v", "--", "--doctest-modules" ]
