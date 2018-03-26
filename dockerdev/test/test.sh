#!/bin/sh

if [ -f requirements.txt ]; then
    pip install -r requirements.txt
fi

if [ "--watch" = "$1" ]; then
	shift
	ptw -v --config /usr/test/pytest.ini /usr/src/app "$@"
else
	pytest -c /usr/test/pytest.ini --rootdir=/usr/src/app "$@"
fi
