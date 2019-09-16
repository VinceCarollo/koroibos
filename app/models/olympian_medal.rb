class OlympianMedal < ApplicationRecord
  validates_presence_of :type
  belongs_to :olympian
  belongs_to :event
end
