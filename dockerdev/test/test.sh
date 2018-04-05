#!/bin/sh
# Create Python App
# by Mnebuerquo
# https://github.com/mnebuerquo/create-python-app
# Please keep the above link in place if you are using this in your project!

if [ -f requirements.txt ]; then
    pip install -r requirements.txt
fi

if [ "--watch" = "$1" ]; then
	shift
	ptw -v --config /usr/test/pytest.ini /usr/src/app "$@"
else
	pytest -c /usr/test/pytest.ini --rootdir=/usr/src/app "$@"
fi
