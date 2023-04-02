class CreateServices < ActiveRecord::Migration[7.0]
  def change
    create_table :services do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.integer :available_days, array: true, default: [] # declare as an array of integers with a default value of an empty array
      t.time :available_time_start
      t.time :available_time_end
      t.integer :category_id
      t.integer :location_id
      t.timestamps
    end
  end
end

