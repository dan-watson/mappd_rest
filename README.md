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
* Single model POST - e.g - /books
* Single model PATCH - e.g - /books/1
* ~~Single model DELETE - e.g - /books/1~~
* Schema - e.g - /books/schema
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

## Running

```ruby
  # config.ru
  run Mappd::Rest
```
