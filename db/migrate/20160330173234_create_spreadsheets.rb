class CreateSpreadsheets < ActiveRecord::Migration
  def change
    create_table :spreadsheets do |t|
      t.string :name
      t.string :attachment

      t.timestamps null: false
    end
  end
end
