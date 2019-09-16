class OlympianMedal < ApplicationRecord
  validates_presence_of :medal_type
  belongs_to :olympian
  belongs_to :event
end
