# Koggle

Project for Web Engineering Lecture WS2022/23.  
Kevin Choong, 33310631

## System requirements

- **Ruby** 3.2.0
- **Rails** 7.0.4
- **SQLite** for database
- **ImageMagick** and **libvips** for image processing

## Installation and Deployment

```shell
git clone 
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

## Configuration

## Services

### Cronjobs

## Tests
