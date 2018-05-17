require 'active_record'

class Author < ActiveRecord::Base
  field :name, :string
  has_many :books
end
