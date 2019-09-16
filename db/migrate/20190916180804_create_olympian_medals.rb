class CreateOlympianMedals < ActiveRecord::Migration[5.1]
  def change
    create_table :olympian_medals do |t|
      t.string :type
      t.references :olympian, foreign_key: true
      t.references :event, foreign_key: true
    end
  end
end
