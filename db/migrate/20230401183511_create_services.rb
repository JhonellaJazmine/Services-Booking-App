class CreateServices < ActiveRecord::Migration[7.0]
  def change
    create_table :services do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.date :available_date
      t.time :available_time
      t.integer :category_id
      t.integer :location_id
      t.integer :admin_id
      t.timestamps
    end
  end
end
