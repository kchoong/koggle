# Koggle

Project for Web Engineering Lecture WS2022/23.  
Kevin Choong, 33310631

This project is a time tracking system for a company, where the company can have multiple location and offices.  
The employees will check in and out of an office via a terminal webpage, that has to be setup in each location. 
To check in and out the employees need to currently enter their personal PIN code, that they can see on their dashboard after logging in. 

## Features

- Terminal for offices and buildings
- Report generation by year, month, day (HTML, JSON, XML, Excel)
- Graph representation of work shifts
- Vacation and birthday tracking

## System requirements

- **Ruby** 3.2.0
- **Rails** 7.0.4
- **Yarn** for JavaScript packages
- **SQLite** for database
- **ImageMagick & libvips** for image processing
- **crontab** for cronjobs

## Installation and Deployment

```shell
git clone https://github.com/sekassel/abschlussprojekt-kchoong.git koggle
cd koggle
bundle install
rails db:drop db:create db:migrate db:seed # More information below
bin/dev
```

## Database

For this project I will be using a simple SQLite database. To initialize the database run the following command:
```shell
rails db:drop db:create db:migrate
```

**Warning:** The seed will only generate test data and should not be used for production.  
To create some test data to play around with use the following seed command:
```shell
rails db:seed
```

### Development & Test Login

You can login to the development/test system, that contains the seed data with the following authentications:

For an administrator account use: 

- Username: `admin1`
- E-Mail: `admin1@mail.azg`
- Password: `admin1`

For an normal account use:

- Username: `testuser1`
- E-Mail: `testuser1@mail.azg`
- Password: `testuser1`

## Services

### Cronjobs

For the cronjobs I have used the gem [whenever](https://github.com/javan/whenever). To add the cronjobs of the project, run the following command:
```shell
whenever --update-crontab
```
This will add our cronjobs to the cron table of your system. You do not need to restart your cron service.
