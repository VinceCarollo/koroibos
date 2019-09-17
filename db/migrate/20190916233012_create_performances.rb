class CreatePerformances < ActiveRecord::Migration[5.1]
  def change
    create_table :performances do |t|
      t.string :medal
      t.string :games
      t.references :olympian, foreign_key: true
      t.references :event, foreign_key: true
    end
  end
end
