class AddAgeAndHeightToOlympians < ActiveRecord::Migration[5.1]
  def change
    add_column :olympians, :height, :integer
    add_column :olympians, :weight, :integer
  end
end
