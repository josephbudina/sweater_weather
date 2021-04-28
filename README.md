# Sweater Weather

Sweater Weather is an api that can allow a user to plan road trips. When your current location and desired location are given this app will give you great info about your newly planned trip! You will get the length of time the trip will take and the current weather when you arrive, and more!
## Summary

  - [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Installing](#installing)
  - [Endpoints](#endpoints)  
  - [How to test](#running-the-tests)
  - [Authors](#authors)

## Getting Started

These instructions will get you a copy of the project up and running on
your local machine for development and testing purposes. See deployment
for notes on how to deploy the project on a live system.

### Prerequisites

* __Ruby__

  - The project is built with ruby on rails using __ruby version 2.5.3p105__, install ruby on your local machine first. Please visit the [ruby](https://www.ruby-lang.org/en/documentation/installation/) home page to get set up. _Please ensure you install the version of ruby noted above._

* __Rails__
  ```
  gem install rails --version 5.2.5
  ```

* __Postgres database__
  - Visit the [postgresapp](https://postgresapp.com/downloads.html) homepage and follow their instructions to download the latest version of Postgres app.

### Installing

1. Clone the repo
  ```
  $ git clone git@github.com:josephbudina/sweater_weather.git
  ```

2. Install gems
  ```
  $ bundle install
  ```

3. Create, migrate and seed rails database
  ```
  $ rails db:{create,migrate}
  ```

4. Set up Environment Variables:
  - run `bundle exec figaro install`
  - add the below variable to the `config/application.yml` if you wish to use the existing email microservice. Otherwise you replace it the value with service if desired.
  ```
    mapquest_key: <your mapquest api>
    open_weather_map_key: <your open weather api>
    pexels_key: <your pexels api>
  ```
## Endpoints
| HTTP verbs | Paths  | Used for |
| ---------- | ------ | --------:|
| GET | /api/v1/forecasts?location=denver,co | Finds different variants of weather in the specified city |
| GET | /api/v1/backgrounds?location=denver,co | Finds background image for given city |
| POST | /api/v1/users | Creates a new user |
| POST | /api/v1/sessions | Creates a new session for logged in user |
| POST | /api/v1/road_trips | Allows a user to set up a road trip |

## Running the tests
- To run the full test suite run the below in your terminal:
```
$ bundle exec rspec
```
- To run an individual test file run the below in tour terminal:
```
$ bundle exec rspec <file path>
```
for example: `bundle exec rspec spec/requests/api/v1/forecast/index_spec.rb`

## Authors
  - **Joseph Budina**