class CreateDoses < ActiveRecord::Migration
  def change
    create_table :doses do |t|
      t.string :description
      t.integer :cocktail_id
      t.integer :ingredient_id

      t.timestamps null: false
    end
  end
end
