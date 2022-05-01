class CreateScheduleTimes < ActiveRecord::Migration[6.0]
  def change
    create_table :schedule_times, id: false do |t|
      t.string :uid, null: false, primary_key: true
      t.date :date
      t.integer :start_time
      t.integer :end_time
      t.string :doctor_uid

      t.timestamps
    end
  end
end
