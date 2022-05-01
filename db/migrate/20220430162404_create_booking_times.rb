class CreateBookingTimes < ActiveRecord::Migration[6.0]
  def change
    create_table :booking_times, id: false do |t|
      t.string :uid, null: false, primary_key: true
      t.date :date
      t.integer :start_time
      t.integer :end_time
      t.string :patient_uid
      t.string :doctor_uid
      t.string :link_meeting

      t.timestamps
    end
  end
end
