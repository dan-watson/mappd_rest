require 'active_record'

class Book < ActiveRecord::Base
  field :title, :string
  field :year, :integer, length: 4
  belongs_to :author

  validates :year, presence: true
end
