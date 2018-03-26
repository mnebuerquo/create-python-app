#!/bin/sh

# Create Python App
# by Mnebuerquo
# https://github.com/mnebuerquo/create-python-app
# Please keep the above link in place if you are using this in your project!

dockerdev="$(cd "$(dirname "$0")" 2>/dev/null 1>&2 && pwd)"
compose="${dockerdev}/docker-compose.yml"

op="build"
target=""
project="${PWD}"
while :; do
    case $1 in
        -b|--build|build) op="build"
        ;;
        -r|--run|run) op="run"
        ;;
        -y|--pytest|pytest) target="pytest"
        ;;
        -w|--watch|watch) target="watch"
        ;;
        -t|--test|test) target="test"
        ;;
        -l|--lint|lint) target="lint"
        ;;
        -d|--dev|dev) target="dev"
        ;;
        -o|--prod|prod) target="prod"
        ;;
        -p|--project) project="$2" ; shift
        ;;
        *) break
    esac
    shift
done

project="$(cd "${project}" 2>/dev/null 1>&2 && pwd)"
name="$(basename "${project}")"

echo "project: ${project}"
echo "compose: ${compose}"
echo "name   : ${name}"

#cd "${dockerdev}"
export PROJECT="${project}"
docker-compose \
    --file "${compose}" \
    --project-directory "${dockerdev}" \
    --project-name "${name}" \
    ${op} \
    ${target} \
    "$@"
