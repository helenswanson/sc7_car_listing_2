class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string  :make,          null: false
      t.string  :car_model,     null: false
      t.string  :color,         null: false
      t.integer :year,          null: false
      t.integer :mileage,       null: false
      t.text    :description
      t.integer :manufacturer_id, null: false

      t.timestamps
    end
  end
end
