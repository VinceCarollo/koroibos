class Olympian < ApplicationRecord
  validates_presence_of :name, :team, :age
  has_many :performances
  has_many :events, through: :performances
  belongs_to :sport
end
