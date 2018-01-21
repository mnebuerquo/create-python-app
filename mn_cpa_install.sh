#!/bin/sh

# Create Python App
# by Mnebuerquo
# https://github.com/mnebuerquo/create-python-app
# Please keep the above link in place if you are using this in your project!

# Use this script to download all the necessary scripts to your project.
# Run it any time to upgrade to the newest version of this tool.
# Happy Pythoning!

REPO="https://github.com/mnebuerquo/create-python-app/blob/master"

# I want to download files from my git repo, but without the .git and stuff.
# This is easiest with just a wget, but it's tedious since I have to
# download each file.

wget "$REPO/mn_build"
wget "$REPO/mn_cpa_install.sh"
wget "$REPO/mn_Dockerfile"
wget "$REPO/mn_image"
wget "$REPO/mn_lint"
wget "$REPO/mn_run"
wget "$REPO/mn_test"
wget "$REPO/pip"
wget "$REPO/pytest.ini"
wget "$REPO/python"
