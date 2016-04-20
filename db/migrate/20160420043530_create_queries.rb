class CreateQueries < ActiveRecord::Migration
  def change
    create_table :queries do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
