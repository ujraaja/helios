class CreateHeaders < ActiveRecord::Migration
  def change
    create_table :headers do |t|
      t.string :field
      t.references :query, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
