class CreatePrescriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :prescriptions, id: false do |t|
      t.string :uid, null: false, primary_key: true
      t.string :patient_uid
      t.string :doctor_uid
      t.string :note
      t.string :booking_time_uid

      t.timestamps
    end
  end
end
