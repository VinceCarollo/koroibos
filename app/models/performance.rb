class Performance < ApplicationRecord
  validates_presence_of :medal, :games
  belongs_to :olympian
  belongs_to :event
end
