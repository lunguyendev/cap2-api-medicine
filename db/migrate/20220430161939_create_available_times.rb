class CreateAvailableTimes < ActiveRecord::Migration[6.0]
  def change
    create_table :available_times, id: false do |t|
      t.string :uid, null: false, primary_key: true
      t.date :date
      t.string :available_times, default: [], array: true
      t.string :doctor_uid

      t.timestamps
    end
  end
end
