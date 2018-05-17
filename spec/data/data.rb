require File.expand_path('book.rb', __dir__)

# Book

Book.migrate!
Book.delete_all

Book.create!(title: 'Wind in the willows', year: 1911)
Book.create!(title: 'Once upon a time', year: 1911)
