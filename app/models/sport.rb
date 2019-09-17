class Sport < ApplicationRecord
  validates_presence_of :name

  has_many :olympians
  has_many :events

  scope :with_events, -> { includes(:events) }
end
