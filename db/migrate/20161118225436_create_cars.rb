class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :company
      t.string :name
      t.integer :model
      t.integer :year
      t.string :color

      t.timestamps null: false
    end
  end
end
