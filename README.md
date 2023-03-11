# dockernestdevelopment

This is a simple docker setup for ExpressJS development. Its purpose is to be used as a project template to :

* Create ExpressJS containers
* Install ExpressJS
* Configure container to use type script
* Add's jest dependency
* Configure package.json scripts section

Steps to spin up:

* Copy example.env into ```.env``` and adjust the variables.
* Add as many **exprXX** services as needed in ```docker-compose.yml``` just by cloning the nest01 service.
* In ```docker\env``` add nest01.env files to define environment variables for each container.
* Add other services.
* run ```docker compose up -d --build```. If ```package.json``` file exists on ```app``` folder,
  the initialization script will run an install. Otherwise a new ExpressJS application is scaffolded.

Each container has a directory under ```app``` that is mapped into it. This content is watched, so any change forces a reload.


# How to work with that
After cloning (this repo is a template), edit the ```.gitignore``` file to include your code in the VCS.
Edit files in ```app``` directory with your editor.

Open a terminal in the container to add dependencies to the project.
