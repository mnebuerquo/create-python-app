#!/bin/sh
#
# Create Python App
# by Mnebuerquo
# https://github.com/mnebuerquo/create-python-app
# Please keep the above link in place if you are using this in your project!
#
# Install requirements from file, then freeze requirements to a file
#
# I am not sending output of freeze to stdout like I would like, because
# docker-compose by default merges stdout and stderr, so when using the
# output redirect operator in the calling shell, we get all the output from
# installing in the new requirements.txt. If you pass -T to docker-compose
# run, then you can separate stdout and stderr, so you see the output from
# installing requirements, but the output from freezing goes to a file.
# I wanted the command to be docker-compose run freeze > requirements.txt
# but that doesn't work.
#
# Instead of using stdout, I just allow the user to specify a filename as an
# argument. This isn't what I want, but it works.
#
# The final command line for this is:
# docker-compose run freeze
#
# or to specify an alterate filename:
# docker-compose run freeze requirements.freeze
# 
if [ -f requirements.txt ]; then
    pip install -r requirements.txt 2>>/proc/self/fd/2 1>&2
fi

requirements="${1:-requirements.txt}"

pip freeze > "${requirements}"
