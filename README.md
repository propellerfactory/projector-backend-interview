# Projector Backend Interview
Hello, and welcome to Projector's Backend Interview!

Thank you so much for investing your time in this project! It's our hope that this format will help make figuring out if we're a match for each other more practical, more realistic and a lot less stressful than asking you to solve puzzles or write algorithms on a whiteboard on demand.

Please read through these instructions in their entirety before you begin (no really), and please don't hesitate to reach out to us with any questions!

We have a two big goals in asking you to complete this project:

1. Give you a little window into the flavor of backend development we practice at Projector.
2. Provide a way to calibrate a discussion of what we expect from backend developers at Projector.

As you work to complete this project, you'll commit your work to your own copy of the project repository on Github so we can review at the end. If all goes well, we'll schedule time together to discuss your code. This project is meant to be a vehicle for us to chat and figure out if we're a match for each other. The code is important, but we really value the discussion around it! 

The goal of this project is not to test your ability to write clever code, but to figure out if we're a match. We're big fans of simple, clear code, so when in doubt, don't overthink it.

Before we get started, let's talk big picture. 

In this project, you'll be working on a set of REST endpoints, extending some existing ones and adding some new ones. In executing this project you'll perform the following activities:

1. Use Microsoft's Visual Studio Code (VSCode) to edit and create source files. 
2. Use VSCode's integrated terminal to run tests and interact with the database.
3. Use VSCode's debugger to launch and debug the backend application.
4. Exercise the backend application's functionality using a simple web client.

We picked VSCode for this project for two main reasons:

1. It's what we use at Projector for all development.
2. We can use its ability to work in a container to provide a complete sandboxed environment to get you up and running with a minimum of setup steps.

You can check out an overview video that shows a lot of what's in this README.md here:

https://youtu.be/j_3d6Hhpu-E

## Ground Rules
A few ground rules for the interview project:

1. This project is intended to take a couple of hours and we'll cap it at 48 hours of off and on work.
2. Before you begin, join the private Slack channel we created just for working on this project together with you. How we communicate and vibe together is as important to us as the code you commit!
3. Make your own private copy of this repository on Github (not just a local clone of the original), and don't forget to invite us as collaborators. Commit your work as you go into your copy of this repository on Github with `git`. At least one commit for each of the major steps. Treat commits to the repository like you would commits to main on a team project.
4. At Projector, we make sure that our code passes lint and transpiles without warnings. The project as you are inheriting should transpile with no errors or warnings. Ideally that will still be the case after you extend it.
5. We like comments at Projector! With the two big goals of the interview at the top of this README in mind, we suggest that a few comments here and there will help us (and maybe you) understand your thinking and provide discussion points for our conversations.
6. It's cool to use the Internet to complete this project. Let's face it, we all lean on Stack Overflow and blog posts on the daily. We care about comprehension, problem solving, getting things done, and the ability to talk with each other and explain the work we're doing. Those are things we're hoping to learn from this project, not if you have an eidetic memory.
7. We strongly recommend checking in with us on Slack a few times while you work to complete this project. Especially if you get stuck, but just, like, generally. This is our opportunity to see what it's like to work together in a largely remote world. Let's take advantage of it! We get that you might be doing this during off hours, it's cool, Slack us any time.

## Setup
To setup this project, you'll need a computer to work on, a connection to the Internet and a little patience for the container download and rebuild steps. 

We are primarily a Mac based shop at Projector and the instructions below assume you're on a Mac. While it should be possible to perform this project on a Windows or Linux based computer, you'll be a bit on your own for setup technical support for non Mac based computers. Also, please note that this project does not support the the new M1 based Macs (Docker Desktop for Mac does not yet officially support M1 based Macs at the time of this writing).

You'll need to install the following software on your computer:

1. Visual Studio Code (https://code.visualstudio.com/download)
2. Docker Desktop for Mac (https://hub.docker.com/editions/community/docker-ce-desktop-mac)
3. Git (via Apple Xcode from the Mac App Store or standalone from https://sourceforge.net/projects/git-osx-installer/)
4. Google Chrome

You may already have much of this software installed, but it's around ~2.5GB of downloading if you are starting from scratch (a little less than one high definition Netflix stream). Most of the installation steps should go pretty quick, but the initial container build steps may take some time depending on your specific computer hardware. Here's what the download sizes look like for those components at the time of this writing:

1. Visual Studio Code (~97MB)
2. Docker Desktop (~549MB)
3. Git (~28MB standalone, ~11.6GB via Apple Xcode)
4. Google Chrome (~95MB)
5. Docker Containers (~1GB Projector Interview, ~360MB Cloudserver, ~540MB MySQL)

Note that if you're setting up Docker Desktop for the first time on the computer you're completing this project on, you may want to bump its resouce limits if you find things running slower than expected. Check out the YouTube video at the top of this README for an example of doing this.

Once those first four components are installed, you'll need to launch Visual Studio code and install the `Remote Development for Containers` extension. From inside Visual Studio Code, you can do this by selecting the `View->Command Palette...` menu item, typing `"Install Extensions"` and pressing "enter". Search for the `Remote - Containers` extension and install it.

You'll then need to create a copy of this repository and clone this repository to a directory of your choice on your computer. Click the "Use this template" button on this repository in GitHub, and create a private copy. You'll be committing your work to share it with us when you're done, so making a copy the repository on GitHub before you clone is an important step. Make sure to invite us as collaborators to your private copy as a first step so we can collaborate.

Open the folder you've cloned this repository to in Visual Studio Code, and then in the lower left hand corner of Visual Studio Code, you'll see a little green box with `><` in it. Click that and select `Reopen in Container`. This may take some time as Visual Studio Code will download and build the docker container you'll be working in during this project. If you'd like to follow the progress, click the "show logs" link in the notification that pops up in the lower right corner of Visual Studio Code after selecting `Reopen in Container`.

Upon success, the little green `><` should change to read `Dev Container: Projector Backend Interview`.

You'll be working from the integrated terminal inside of Visual Studio Code. Open one now by selecting `View->Terminal`. In some cases, you may need to click the `+` button in the terminal panel's title bar to create a new integrated terminal.

From the integrated terminal, type:

```
root@123edfc93ebb:/workspace# make update
```

This will install all the `node_modules` required for the rest of this project. Depending on your Internet connection, this could take a little time.

At this point, you should be all setup and ready to begin the project!

## Transpiling
You'll be coding this project in TypeScript. Don't know TypeScript? Don't stress! TypeScript is largely backwards compatible with vanilla JavaScript and we'll be keeping TypeScript specific language features to a bare minimum in this project. We use TypeScript at Projector for both our frontend and backend development (although we also use golang, C/C++ and some rust on the backend).

Since stable versions of nodejs do not yet directly support TypeScript, this project relies on using webpack to transpile TypeScript source files into plain JavaScript. Specifically webpack transpiles all the TypeScript source in this project to `bundles/index.js`.

To transpile the project, type the following in the Visual Studio Code integrated terminal:

```
root@123edfc93ebb:/workspace# make watch
```

Webpack will transpile the TypeScript source files of the project, and once complete (errors or not) will watch for any changes to TypeScript source files. If you make any changes to TypeScript source files, `make watch` will restart the transpilation process and report warnings, errors or success in the integrated terminal.

## Running and Debugging
To run and debug the project, click the debug icon in the Visual Studio Code sidebar. You'll see a `RUN` title bar with a dropdown list of targets. Make sure `Projector Backend Interview` is selected, and click the green "play" button to start debugging.

Once running, you can see the output log statements and interact with the project in the Debug Console tab near the integrated terminal. You can also pause, set breakpoints, watches and single step the running project.

After your changes are transpiled by `make watch`, you'll need to stop and restart debugging, or simply click the restart icon in the debug floating toolbar (next to pause, single step, etc). 

**Worth repeating: while the transpiling happens automatically on every edit you make thanks to `make watch`, you have to manually restart the app to see your changes take effect.**

You can point your web browser at:

http://localhost:9090

to interact with the running project.

## Tests
As part of this project, you'll be writing some tests, and running those tests using `jest`. Note that `jest` might take a bit to run the first time as it also transpiles the code before running the tests. So if it takes a few seconds, just be patient and wait before killing and restarting it.

To run tests type the following in the Visual Studio Code integrated terminal:

```
root@123edfc93ebb:/workspace# make tests
```

You can also filter what tests to run. For example, to run just tests with "signin" in the file name, type the following in the Visual Studio Code integrated terminal:

```
root@123edfc93ebb:/workspace# TEST=signin make tests
```

You can also run the tests in "watch" mode, where any changes to the TypeScript files will automatically re-run tests. Tests iteration is much faster this way, not just because you don't have to keep typing `make tests` but also becaused `jest` caches parts of the test process. If you're making lots of sweeping changes to source files, this can be annoying, so you may want to switch back and forth beween running tests manually, or running them in watch mode. To run tests in watch mode type:

```
root@123edfc93ebb:/workspace# make watch-tests
```

If you are familiar with `jest`, you'll know that it's interactive and there are several ways to filter and control which tests should be run. Try pressing 'p' in the integrated terminal when using `make watch-tests` to change to "pattern mode".

One strategy you might consider is creating a second integrated terminal in Visual Studio Code (the split icon to the right of the "+" button in the integrated terminal's toolbar) and running `make watch` in the first and `make watch-tests` in the second.

## Project
Ok, hopefully at this point, your environment for the Projector Backend Interview is all set up and you're ready to get started! Woohoo!

In this project, you'll be completing the backend implementation of a fictional web app.

Users of this app will nagivate to http://localhost:9090 and see our landing page. From there, they can sign up for a new account, or sign in if they already have an account. 

Once signed in, our users will be redirected to our app at http://localhost:9090/app. Users that haven't signed in yet that try to visit our app will be redirected to the sign in page.

Your mission, should you choose to accept it is:

1. When users sign up, they may type their first and last name using whacky capitalizations. We'll preserve what they type in the database, but we've decided that the http://localhost:9090/v1/user endpoint should normalize the capitalization. The rules are: the first letter of each space or dash delimited word in their name should be upper case, with the rest of the letters lowercase. So instead of `{"firstName":"bob", "lastName": "jOnes"}` we should return `{"firstName": "Bob", "lastName": "Jones"}`. Instead of `{"firstName":"jane sue", lastName: "doe-sMIth"}` we should return `{"firstName: "Jane Sue", "lastName": "Doe-Smith"}`. Add some new tests to confirm these two cases work.

2. Implement the http://localhost:9090/v1/signout endpoint. The app page already has a link to the endpoint. You'll need to figure out where the code should live and then have it delete the authenticated session from the database. Finally, the endpoint should redirect the user back to the landing page at http://localhost:9090. Add a new signout test to confirm nobody accidentially breaks your code with their changes in the future.

3. Some of our users are reusing the same password they use in other apps, and had their password compromised. We need to implement a way for them to change their password at the http://localhost:9090/settings page. Implement the http://localhost:9090/v1/password endpoint based on the JavaScript in the settings.html page. Add a test to validate your endpoint.

4. Our users seem to be picking really poor passwords. Update the http://localhost:9090/v1/signup and http://localhost:9090/v1/password endpoints to not allow weak passwords. Our requirements will be a minimum of eight characters and passwords must contain at least one letter, one symbol and one number. Add a test to validate your endpoint.

5. The most requested feature from our users for their accounts is the ability to have an avatar. Implement the http://localhost:9090/v1/avatar endpoint to accept POST'd image files as invoked by the http://localhost:9090/settings page and upload them to the project's S3 bucket. GET requests to the http://localhost:9090/v1/avatar endpoint should return the avatar stored in the project's S3 bucket.

6. Bonus points: implement the http://localhost:9090/v1/avatar tests.

Please don't hesitate to reach out for help if you get stuck. That's what we do as a team working together, right? In fact, seriously, reach out to us. We can learn a lot about what it will be like to work together from chatting with each other on Slack!

# Appendix
The sections below have information on some additional tools installed in the development environment that might come in handy as you work to complete the project.
## Interacting with MySQL
You can interact with MySQL using the `mysql` command line client. For example:

```
root@123edfc93ebb:/workspace# mysql
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MySQL connection id is 10
Server version: 5.7.33 MySQL Community Server (GPL)

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MySQL [project]> show tables;
Empty set (0.000 sec)

MySQL [project]> 
```

## Interacting with S3
You can interact with (fake) S3 using the `aws` command line client. For example:

```
root@123edfc93ebb:/workspace# aws s3 ls
2021-02-08 05:43:57 project
```

This is a local mock version of S3 implemented by Zenko Cloudserver.

## Resetting the Environment
If at any time you want to reset the development environment back to its initial state (or delete it when you're done), you can do so with the steps below.

First, note that all the source files you've been editing with are mounted into the Docker containers (rather than stored inside them), so the steps below will not affect them. If you're nervous about losing your work, you can make a backup copy of the repository clone on your computer first.

To reset the environment, make sure Visual Studio Code is not running. Then open a terminal on your Mac, and get a list of the docker containers on your Mac:

```
% docker ps -a                                                        
CONTAINER ID   IMAGE                                                              COMMAND                  CREATED             STATUS                         PORTS                                                                             NAMES
380f9f0ee1e5   projector-backend-interview_devcontainer_app                       "docker-entrypoint.s…"   9 minutes ago       Up 9 minutes                                                                                                     projector-backend-interview_devcontainer_app_1
ed8af5240307   mysql:8                                                            "docker-entrypoint.s…"   9 minutes ago       Up 9 minutes                   3306/tcp, 33060/tcp                                                               projector-backend-interview_devcontainer_db_1
5c6eeaebb8bd   zenko/cloudserver:8.2.6                                            "/usr/src/app/docker…"   9 minutes ago   Up 9 minutes                                                                                                projector-backend-interview_devcontainer_cloudserver_1
```

Find the container IDs of the three 'projector-backend-interview' containers and delete them:

```
% docker rm 380f9f0ee1e5
% docker rm ed8af5240307
% docker rm 5c6eeaebb8bd
```

Finally, we need to remove the persistent volume associated with the MySQL and CloudServer containers:

```
% docker volume ls
DRIVER    VOLUME NAME
local     projector-backend-interview_devcontainer_mysql-data
local     projector-backend-interview_devcontainer_cloudserver-data
local     vscode
```

So that we can remove it too:

```
% docker volume rm projector-backend-interview_devcontainer_mysql-data
% docker volume rm projector-backend-interview_devcontainer_cloudserver-data
```

Next, launch Visual Studio Code, and reopen the Projector Backend Interview remote container. It shouldn't take as long as the first time you opened the project, but you may need a little patience as it restarts the containers.

You should now see your source files as you left them, but the containers will be restarted.
