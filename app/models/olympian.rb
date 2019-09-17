class Olympian < ApplicationRecord
  validates_presence_of :name, :team, :age, :sex, :total_medals_won, :height, :weight
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

  def self.females
    where(sex: "F")
  end

  def self.males
    where(sex: "M")
  end

  def self.average_age
    average(:age)
  end

  def self.average_weight
    average(:weight)
  end
end
