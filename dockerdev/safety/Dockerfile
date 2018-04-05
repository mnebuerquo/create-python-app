# Create Python App
# by Mnebuerquo
# https://github.com/mnebuerquo/create-python-app
# Please keep the above link in place if you are using this in your project!
FROM python:3

WORKDIR /usr/src/app

COPY . /usr/lint

RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r /usr/lint/requirements.txt

# This does not need to install requirements from the user's directory.
# We can just build a static image and run it.

ENTRYPOINT ["safety", "check", "--file=requirements.txt"]
