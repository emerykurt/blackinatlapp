class CreateEateries < ActiveRecord::Migration[6.0]
  def change
    create_table :eateries do |t|
      t.string :name
      t.string :owner
      t.string :type_of_food
      t.string :neighborhood
      t.string :address
      t.string :website
      t.string :instagram
      
      t.timestamps
    end
  end
end
