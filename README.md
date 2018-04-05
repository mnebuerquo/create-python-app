# create-python-app

Like create-react-app, but for python, and dockerized!

# Installing

Run the following commands inside your project directory to add this to your
Python app:

```sh
wget https://raw.githubusercontent.com/mnebuerquo/create-python-app/master/install.sh
sh install.sh <target-directory>
```

The first command downloads the install script, and the second runs the
script, downloads, and configures the rest.

Either place the script in the project where you want to install this, or
run it with the project path as an argument.

Once the install completes, you can run your Python app in a docker
container instead of a virtualenv. It can also be used to build a container
for deploy.

# Usage

Once you have installed the script, you can run the dockerized version of
Python from the local directory instead of the system instance.

## Dev

Run the local python, giving the name of the script as an argument:

```sh
docker-compose run dev app.py
```

This is what you would use for running things in development. Don't forget
to rebuild dev when you add new requirements.

When you next call `docker-compose build dev`, it installs all your new
requirements from `requirements.txt`.

## Test

Create-python-app uses a default requirements.txt containing
[pytest](https://docs.pytest.org/en/latest/), running
[doctest](https://docs.python.org/3/library/doctest.html) with
[pytest-watch](https://github.com/joeyespo/pytest-watch) for
running automated tests while coding. Feel free to replace this with a test
runner of your own.

```sh
docker-compose run pytest
```

*Warning:* The test container only installs dependencies when you build it.
If you add a new dependency to your project and run tests they will fail
until you rebuild the container.

```sh
docker-compose build pytest
```

## Watch

You can run tests whenever a file in your project changes. This is really
useful in a lot of situations. It requires a different container
configuration than the test command described above.

When you run `watch`, it will do a pip install every time it starts. This is
because the container image only contains the test libraries. Any
dependencies added by your project will be installed when the container
starts.

When your code changes, the watcher will re-run the tests without a
installing dependencies. The install step is only when you start the
watcher.

```sh
docker-compose run watch
```

## Lint

Everyone needs to run a linter. This is a great way to improve your code.
I'm using [flake8](http://flake8.pycqa.org/en/latest/index.html) which
combines the powers of a few static code checkers.

```sh
docker-compose run lint
```

## Format

Sometimes you want to try out auto-formatting of code to simplify the cleanup
of old code or so its easy to get new code looking clean before commit.
[Auto formatting python](https://pypi.python.org/pypi/autopep8/1.1.1)
This is now part of this project too, using `docker-compose run format .` in
your project directory. You can pass any path or file as the argument to
format as well.

```sh
docker-compose run format ./src/
docker-compose run format myuglycode.py
```

The format settings should be decent for most projects, and combined with
lint, can help a cleanup effort in a big way.

## Freeze

Edit `requirements.txt` and then `docker-compose run freeze` to pin your
requirements to specific versions and overwrite your requirements.txt file.

This command creates a container, installs all your packages in it, and then
freezes those versions into requirements.txt.

```sh
docker-compose run freeze
```

You can also freeze to a different file by providing a file name on the
command line:

```sh
docker-compose run freeze requirements.freeze
```

*Warning:* `pip install` installs stuff into the container, which is removed
after it runs. So to add a new requirement you can not just run `pip install`!
Edit the requirements.txt instead, and then run `docker-compose build dev`
to install it in the image.

## Safety

[Safety ](https://github.com/pyupio/safety) is a tool for statically
scanning installed packages and checking them against a database of known
package vulnerabilities. In this configuration, it checks the version of every
package pinned in the requirements.txt file.

You need to freeze your requirements before you run safety.

# Environment Variables

Create a `.env` file in your project directory containing environment variables.
These will be loaded into the docker container when it runs, and your python app
will be able to access them by name.

This is where you put secrets, keys, and passwords, so
do not commit it to git. For deploying to servers, your CI system probably
has a way of setting environment variables when provisioning.

# Deploying to a Server

Coming soon.

# Dependencies

* [Docker](https://www.docker.com/community-edition) is required for running the
  containerized python. Community edition is fine, you don't need enterprise
  support for this.
* [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) is
  required for the installer. It clones this repo in a temp directory,
  copies the necessary files to your project, then removes the cloned repo
  from the temp directory.
* [wget](https://stackoverflow.com/a/9491666/5114) is required for the installer
  to download files. This may not be installed on all systems by default,
  but it's easy to find instructions with a google search.

# TODO

* Debugger Support
    - [pudb](https://pypi.python.org/pypi/pudb)
    - [pdb](https://docs.python.org/3.6/library/pdb.html)
    - [web-pdb](https://pypi.python.org/pypi/web-pdb)
* Separate environment files for test and development
* Deploy to production with instructions
	- Gitlab CI
	- Manual deploy instructions
	- Other CI tools?
* Environment variable to choose between python3 (default) and python2.7 in
  the install. This is a low priority for me, because any new projects at
  this point should use python3. I do not plan to support python2 unless
  someone asks me for it.

# Opportunities for Improvement

First, `pip install` is done in the build step. This is so you can just run
the container and have short startup time. The installed packages are not
in a volume, but in the container. This means you can't just `pip install
somepackage`, but you have to add it to `requirements.txt` and then do a
`docker-compose build` to rebuild the container with the new requirement. You
can then do a `docker-compose run dev -m pip freeze > requirements.txt` to
capture the installed packages, but managing the packages is harder with them
inside the container.

I could put the pip install directory in a volume for dev, test, and watch, so
that it persists between containers. That would complicate rebuilds, as well
as having another path in user space for it. The prod build should have
dependencies installed in the container like it is now.

Also, adding network ports or additional volumes is not yet supported. To do
this, you would have to install this into your own project and then edit the
files. Then it can be committed to source control with the rest of your
code.

# Inspiration

* [create-react-app](https://github.com/facebookincubator/create-react-app)
    : a scaffolding for creating a React app without having to figure out
    all the boilerplate
* [whalebrew](https://github.com/bfirsh/whalebrew)
    : Like homebrew, but using docker images to keep everything isolated.
* [Article about docker ENTRYPOINT](http://goinbigdata.com/docker-run-vs-cmd-vs-entrypoint/)
* Team Echo
    : The team I worked with at Kroger Digital. They use Docker for everything.

# Issues and Pull Requests Welcome!

Please let me know how this can be improved for your uses. It's still an
experiment, but I think it's the way of the future.
