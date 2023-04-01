class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :contact_number
      t.string :password_digest
      t.string :street
      t.string :barangay
      t.string :city
      t.string :province
      t.string :postal_code
      t.timestamps
    end
  end
end
