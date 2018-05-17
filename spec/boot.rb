require 'rubygems' unless defined?(Gem)
require 'bundler/setup'
Bundler.require
require File.expand_path('data/book.rb', __dir__)
require 'mappd_rest'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3',
                                        database: 'db/test.db')

Dir.glob('spec/data/**/*.rb').each do |file_path|
  basename = File.basename(file_path, File.extname(file_path))
  clazz = basename.camelize.constantize
  next if clazz.abstract_class
  clazz.migrate! if clazz.ancestors.include?(ActiveRecord::Base)
end
