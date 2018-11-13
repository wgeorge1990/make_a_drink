class CreateDrinkIngredients < ActiveRecord::Migration[5.2]

def change
    create_table :drink_ingredients do |t|
      t.integer :ingredients_id
      t.integer :drinks_id
    end
  end
end
