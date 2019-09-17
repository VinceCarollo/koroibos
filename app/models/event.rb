class Event < ApplicationRecord
  validates_presence_of :name
  belongs_to :sport
  has_many :performances
  has_many :olympians, through: :performances

  def medalists(limit=nil)
    self.olympians
      .select('olympians.*, performances.medal')
      .where("performances.medal != 'NA'")
      .limit(limit)
  end
end
