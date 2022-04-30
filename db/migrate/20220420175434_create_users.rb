class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users, id: false do |t|
      t.string :uid, null: false, primary_key: true
      t.string :name
      t.string :type
      t.string :email
      t.string :major
      t.string :experience
      t.string :national_id
      t.string :religion
      t.string :residential_address
      t.string :address
      t.string :national
      t.string :province
      t.string :district
      t.string :wards
      t.string :hash_password
      t.string :phone
      t.integer :status, default: 0
      t.date :birthday
      t.integer :role, default: 0
      t.string :avatar

      t.timestamps
    end
    add_index :users, :uid, unique: true
    add_index :users, :email
  end
end
