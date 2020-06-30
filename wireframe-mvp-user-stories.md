# App Overview
I am going to build an app where a user will be able to sign up for open microphone night.

# User Stories

## Users will be able to...
 - sign up, log in and log out.

## As a user, I can...
 - sign up for open mic night.
 - see all their open mic night performances.
 - edit their open mic night performances.
 - delete their open mic night performances.


# Wireframing

## Models will be User and Performance

## User Model Attributes
 - name (of singer)
 - cellphone
 - password (using bcrypt this will be 'password_digest' in the db)
 - ASSOCIATIONS: has_many :performances

## Performance Model Attributes
 - Song
 - Artist
 - Genre
 - User_ID   <--- Foreign Key
 - AlbumImage  <--- stretch goal to link to Spotify API for data
 - ASSOCIATIONS: belongs_to :user

# MVP
Users can signup to use the app, log in and out, sign up to participate in open mic night, edit/view/delete their sign ups.

# Stretch Goals
CSS - make it look really nice
TDD
Create a EventAdmin user and EventNight models
Include an option for the User to perform more than one performance
Create a set (line up agenda) for the open mic night viewable by event
