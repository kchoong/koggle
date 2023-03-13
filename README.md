# Koggle

Project for Web Engineering Lecture WS2022/23.  
Kevin Choong, 33310631

## System requirements

- **Ruby** 3.2.0
- **Rails** 7.0.4
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

## Services

### Cronjobs

For the cronjobs I have used the gem [whenever](https://github.com/javan/whenever). To add the cronjobs of the project, run the following command:
```shell
whenever --update-crontab
```
This will add our cronjobs to the cron table of your system. You do not need to restart your cron service.

## Tests
