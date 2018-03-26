#!/bin/sh

if [ -f requirements.txt ]; then
    pip install -r requirements.txt
fi

ptw -v --config /usr/test/pytest.ini /usr/src/app "$@"
