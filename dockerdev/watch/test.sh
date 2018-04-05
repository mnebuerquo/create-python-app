#!/bin/sh
# Create Python App
# by Mnebuerquo
# https://github.com/mnebuerquo/create-python-app
# Please keep the above link in place if you are using this in your project!

if [ -f requirements.txt ]; then
    pip install -r requirements.txt
fi

ptw -v --config /usr/test/pytest.ini /usr/src/app "$@"
