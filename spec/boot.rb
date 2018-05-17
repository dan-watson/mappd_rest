require 'rubygems' unless defined?(Gem)
require 'bundler/setup'
Bundler.require
require 'mappd_rest'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3',
                                        database: 'db/test.db')

require File.expand_path('data/data.rb', __dir__)
