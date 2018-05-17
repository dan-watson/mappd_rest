require 'active_record'

class Book < ActiveRecord::Base
  field :title, :string
  field :year, :integer, length: 4
end
