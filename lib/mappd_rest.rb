require 'rubygems' unless defined?(Gem)
require 'active_record'
require 'mappd'
require 'mappd/mappd_rest'

ActiveRecord::Base.send(:include, MappdRest)
