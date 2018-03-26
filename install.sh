#!/bin/sh

# Create Python App
# by Mnebuerquo
# https://github.com/mnebuerquo/create-python-app
# Please keep the above link in place if you are using this in your project!

# Use this script to download all the necessary scripts to your project.
# Run it any time to upgrade to the newest version of this tool.
# Happy Pythoning!

set -e

target_dir="$1"
if [ -z "${target_dir}" ]; then
	target_dir="$PWD"
fi

tempdir=$(mktemp -d)

cd "${tempdir}"
git clone git@github.com:mnebuerquo/create-python-app.git
cd "create-python-app"
cp -R "dockerdev"
cp "docker-compose.yml" "${target_dir}/"
cd "${target_dir}"
rm -rf "${tempdir}"
