require 'rubygems' unless defined?(Gem)
require 'active_record'
require 'mappd_rest/mappd_rest'

ActiveRecord::Base.send(:include, MappdRest)
