class Event < ApplicationRecord
  validates_presence_of :name
  belongs_to :sport
  has_many :performances
  has_many :olympians, through: :performances
end
