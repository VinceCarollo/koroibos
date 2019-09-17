class OlympianSerializer < ActiveModel::Serializer
  attributes :name,
             :team,
             :age,
             :sex,
             :total_medals_won,
             :sport

  def sport
    object.sport.name
  end
end
