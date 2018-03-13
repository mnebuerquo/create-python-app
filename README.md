# create-python-app
Like create-react-app, but for python, and dockerized!

# Installing
Run the following commands inside your project directory to add this to your
Python app:

```sh
wget https://raw.githubusercontent.com/mnebuerquo/create-python-app/master/mn_cpa_install.sh
sh mn_cpa_install.sh
```

The first command downloads the install script, and the second runs the
script, downloads, and configures the rest.

Once the install completes, you can run your Python app in a docker
container instead of a virtualenv. It can also be used to build a container
for deploy.

# Usage
Once you have run the install script, you can run the dockerized version of
Python and Pip from the local directory instead of the system instance.

## Python
Run the local python, giving the name of the script as an argument:

```sh
./python app.py
```

## Pip
Edit `requirements.txt` and then `./mn_build` to install new requirements.

Then use pip to freeze requirements:

```sh
./pip freeze > requirements.txt
```

When you next call `./mn_build`, it installs all your new requirements from
`requirements.txt`. The versions of every dependency are saved there too for
building identical containers in the future.

*Warning:* This installs stuff into the container, which is removed after it
runs. So to add a new requirement you can not just run `pip install`!

## Test
Create-python-app installs a default requirements.txt containing
[pytest](https://docs.pytest.org/en/latest/), running
[doctest](https://docs.python.org/3/library/doctest.html) with
[pytest-watch](https://github.com/joeyespo/pytest-watch) for
running automated tests while coding. Feel free to replace this with a test
runner of your own.

```sh
./mn_test
./mn_test --watch
```

 ## Lint
Everyone needs to run a linter. This is a great way to improve your code.
I'm using [flake8](http://flake8.pycqa.org/en/latest/index.html) which
combines the powers of a few static code checkers.

```sh
./mn_lint
```

## Environment Variables

Create a `.env` file containing environment variables. These will be loaded
into the docker container when it runs, and your python app will be able to
access them by name. You can set variables for Pip, Python, and the Test
runner in this file.

This is where you put secrets, keys, and passwords, so
do not commit it to git. For deploying to servers, your CI system probably
has a way of setting environment variables when provisioning.

# Deploying to a Server

Coming soon.

# Dependencies

* [Docker](https://www.docker.com/community-edition) is required for running the
  containerized python. Community edition is fine, you don't need enterprise
  support for this.
* [wget](https://stackoverflow.com/a/9491666/5114) is required for the installer
  to download files. This may not be installed on all systems by default,
  but it's easy to find instructions with a google search.

# TODO

* [Safety ](https://github.com/pyupio/safety)
* Debugger Support
    - [pudb](https://pypi.python.org/pypi/pudb)
    - [pdb](https://docs.python.org/3.6/library/pdb.html)
    - [web-pdb](https://pypi.python.org/pypi/web-pdb)
* Environment variable to choose between python3 (default) and python2.7 in
  the install
* Separate environment files for test and development
* Combine lint and test into one command as command line arguments (maybe)
* Deploy to production guide

There are a few things I'm not real happy about. First, because the
Dockerfile must be at the root of the filesystem copied to the container,
this must be in the root level of the project. Second, I have several
scripts here so it's even more clutter in the project root directory.

I think there should be a way to move this stuff to its own directory inside
the project, but I'm not sure how yet. Maybe by just making the project
directory a volume I won't need the dockerfile. But then I might have to
build and run pip install more often.

Also, `pip install` is done in the build step. The installed packages are not
in a volume, but in the container. This means you can't just `pip install
somepackage`, but you have to add it to `requirements.txt` and then do a
`./mn_build` to rebuild the container with the new requirement. You can then do
a `pip freeze > requirements.txt` to capture the installed packages, but
managing the packages is harder with them inside the container.

I could put the pip install directory in a volume, so that it persists
between containers. That would complicate rebuilds, deploying to prod, and
removing dependencies.

# Inspiration

* [create-react-app](https://github.com/facebookincubator/create-react-app)
    : a scaffolding for creating a React app without having to figure out
    all the boilerplate
* [whalebrew](https://github.com/bfirsh/whalebrew)
    : Like homebrew, but using docker images to keep everything isolated.
* Team Echo
    : The team I worked with at Kroger Digital. They use Docker for everything.

# Issues and Pull Requests Welcome!

Please let me know how this can be improved for your uses. It's still an
experiment, but I think it's the way of the future.
