class Olympian < ApplicationRecord
  validates_presence_of :name, :team, :age
  has_many :olympian_medals
  has_many :events, through: :olympian_medals
  belongs_to :sport
end
