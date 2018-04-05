# Create Python App
# by Mnebuerquo
# https://github.com/mnebuerquo/create-python-app
# Please keep the above link in place if you are using this in your project!
FROM python:3

RUN pip install --upgrade pip
RUN pip install pytest-watch

WORKDIR /usr/src/app
COPY . /usr/freeze

ENTRYPOINT [ "sh", "/usr/freeze/freeze.sh" ]
