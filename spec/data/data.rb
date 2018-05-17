require File.expand_path('book.rb', __dir__)
require File.expand_path('author.rb', __dir__)

# Book

Book.migrate!
Author.migrate!
Book.delete_all
Author.delete_all

author = Author.create!(name: 'Dan')
author2 = Author.create!(name: 'James')

Book.create!(title: 'Wind in the willows', year: 1911, author: author)
Book.create!(title: 'Once upon a time', year: 1911, author: author)
Book.create!(title: 'Not another one', year: 2012, author: author2)
