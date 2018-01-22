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
Or use the local pip to install and freeze requirements:

```sh
./pip install scipy numpy pandas
./pip freeze > requirements.txt
./pip install -r requirements.txt
```

## Test
Create-python-app installs a default requirements.txt containing 
[pytest](https://docs.pytest.org/en/latest/), running 
[doctest](https://docs.python.org/3/library/doctest.html) with 
[pytest-watch](https://github.com/joeyespo/pytest-watch) for
running automated tests while coding. Feel free to replace this with a test
runner of your own.

```sh
./mn_test
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

* Docker is required for running the containerized python.
* wget is required for the installer to download files.

# TODO

* [Safety ](https://github.com/pyupio/safety)
* Debugger Support
    - [pudb](https://pypi.python.org/pypi/pudb)
    - [pdb](https://docs.python.org/3.6/library/pdb.html)
* Environment variable to choose between python3 (default) and python2.7 in
  the install
* Separate environment files for test and development

# Inspiration

* [create-react-app](https://github.com/facebookincubator/create-react-app)
    : a scaffolding for creating a React app without having to figure out
    all the boilerplate
* [whalebrew](https://github.com/bfirsh/whalebrew)
    : Like homebrew, but using docker images to keep everything isolated.
* Team Echo
    : The team I worked with at Kroger Digital. They're all rockstars.

# Issues and Pull Requests Welcome!

Please let me know how this can be improved for your uses. It's still an
experiment, but I think it's the way of the future.
