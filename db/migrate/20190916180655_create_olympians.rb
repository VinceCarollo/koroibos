class CreateOlympians < ActiveRecord::Migration[5.1]
  def change
    create_table :olympians do |t|
      t.string :name
      t.string :team
      t.integer :age
      t.references :sport, foreign_key: true
    end
  end
end
