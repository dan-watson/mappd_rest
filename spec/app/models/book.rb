require 'active_record'

class Book < ActiveRecord::Base
  restify

  field :title, :string
  field :year, :integer, length: 4
end

Book.migrate!
