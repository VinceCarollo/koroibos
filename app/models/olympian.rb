class Olympian < ApplicationRecord
  validates_presence_of :name, :team, :age
  has_many :olymian_medals
  has_many :events, through: :olymian_medals
  belongs_to :sport
end
