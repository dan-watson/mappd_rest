# MappdRest

Note: Work in progress.

A gem that dynamically exposes REST endpoints for ActiveRecord models.

## Development

### Prerequisites

* Docker Community Edition - https://www.docker.com/community-edition
* Make - https://www.gnu.org/software/make/

### Setup

* `make` will build the application ready for use.

### Guard

* `make guard` run both linting and testing whilst watching files

## Todo

* ~~Single model GET - e.g - /books~~
* ~~Single model GET - e.g - /books/1~~
* ~~Single model POST - e.g - /books~~
* ~~Single model PATCH - e.g - /books/1~~
* ~~Single model DELETE - e.g - /books/1~~
* ~~Schema - e.g - /books/schema~~
* Nested model GET - e.g - /books/likes
* Nested model GET - e.g - /books/likes/1
* Nested model POST - e.g - /books/likes
* Nested model PATCH - e.g - /books/likes/1
* Nested model DELETE - e.g - /books/likes/1
* Authentication Token - Code injection for AUTH TOKEN
* Limiting - e.g /books?limit=10&skip=10

## Setup

```
  gem install mappd-rest
```

Or add to your `Gemfile`:

```
  gem 'mappd-rest'
```

## How it works

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

It does this by dynamically interpreting routes passed to the endpoint and calling the appropriate models and methods.

## Running

```ruby
  # config.ru
  run Mappd::Rest
```
