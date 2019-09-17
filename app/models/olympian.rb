class Olympian < ApplicationRecord
  validates_presence_of :name, :team, :age, :sex, :total_medals_won
  has_many :performances
  has_many :events, through: :performances
  belongs_to :sport

  scope :with_sport, -> { includes(:sport) }

  def self.youngest
    order(:age).take
  end

  def self.oldest
    order(age: :desc).take
  end
end
