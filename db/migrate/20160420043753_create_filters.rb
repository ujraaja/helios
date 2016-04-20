class CreateFilters < ActiveRecord::Migration
  def change
    create_table :filters do |t|
      t.string :field
      t.string :comparator
      t.string :value
      t.references :query

      t.timestamps null: false
    end
  end
end
