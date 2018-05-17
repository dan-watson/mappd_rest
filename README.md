# MappdRest

[![Build Status](https://travis-ci.org/dan-watson/mappd_rest.svg?branch=master)](https://travis-ci.org/dan-watson/mappd_rest)

A gem that dynamically exposes REST endpoints for ActiveRecord models.

## Development

### Prerequisites

* Docker Community Edition - https://www.docker.com/community-edition
* Make - https://www.gnu.org/software/make/

### Setup

* `make` will build the application ready for use.

### Guard

* `make guard` run both linting and testing whilst watching files

## Setup

```
  gem install mappd-rest
```

Or add to your `Gemfile`:

```
  gem 'mappd-rest'
```

## How it works

### Simple Endpoints

Lets say you have two ActiveRecord models. Person and Post. By either mounting the `Mappd::Rest` class inside rails or running a `config.ru` file like below the following endpoints will be created.

| METHOD | ENDPOINT |
| --- | --- |
| GET | /people/schema |
| GET | /people/ |
| GET | /people/:id |
| POST | /people |
| DELETE | /people/:id |
| PUT | /people/:id |
| GET | /post/schema |
| GET | /post/ |
| GET | /post/:id |
| POST | /post |
| DELETE | /post/:id |
| PUT | /post/:id |

### Nested Endpoints

Also you can drive down into nested data. In this example lets say a Post has a Person and a Person has many Posts. It would create the following endpoints.


| METHOD | ENDPOINT |
| --- | --- |
| GET | /posts/:id/person |
| GET | /posts/:id/person/:id |
| GET | /posts/:id/person/:id/posts |

It does this by dynamically interpreting routes passed to the endpoint and calling the appropriate models and methods.

### Limiting & Offsetting (Pagination)
You can also limit and offset any call that returns a collection.

`/posts?limit=10&offset=10`  
`/person/1/posts?limit=5&offset=5`

### Authorisation

Before every request the API will check for a header `X-Access-Token` 
it will then use that access token as a parameter to the authorization method you have set.

```ruby
  # config.ru
  Mappd::Rest.auth_method = lambda { |token|
    # Will look for a truth - You can use any method you like
    User.find_by_token(token).active?
    # For example - if you didnt want to do any kind of auth
    # just return true
  }
  run Mappd::Rest
```
## Running

```ruby
  # config.ru
  run Mappd::Rest
```
