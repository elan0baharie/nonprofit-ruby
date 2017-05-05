# _Volunteer Tracker_

#### _Program to track volunteers and projects, {05.05.17}_

#### By _**E. Baharie**_

## Description

_This program was designed to retain info for a non-profits project list and volunteer dossier. The program save info to the database. If desired this info can be edited, and deleted from the database. Volunteers can be added to projects manually initially or later on in editing their profile_

## Specs

* _Setup database volunteer_tracker on postgres with desired info for two classes_
* _Create a volunteer class with pertinent info for personnel file including a spot for project ids to be assigned_
* _Create a project class with pertinent info_
* _Make methods for saving class specific objects and listing info_
* _Make methods to identify specific objects using ids generated off database_
* _Make methods to update or delete existing info_
* _Make methods to associate project class id with a specific volunteer_

## Setup/Installation Requirements

* _clone page from github_
* _open in command line interface prefered_
* _open postgres and run_
* _CREATE DATABASE volunteer_tracker;_
* _CREATE TABLE projects (id serial PRIMARY KEY, name varchar, location varchar, details text);_
* _CREATE TABLE voluntees (id serial PRIMARY KEY, name varchar, address varchar, details text, project_id int);_

## Known Bugs

_Perhaps_

## Support and contact details

_E. Baharie email: 0elan1@gmail.com files on github.com https://github.com/elan0baharie/nonprofit-ruby.git_

## Technologies Used

_Ruby, Sinatra, Postgres_

### License

*MIT license*

Copyright (c) 2016 **_E. Baharie_**
