class Prescription < ApplicationRecord
  belongs_to :doctor, foreign_key: :doctor_uid, primary_key: :uid
  belongs_to :patient, foreign_key: :patient_uid, primary_key: :uid
  belongs_to :booking_time, foreign_key: :booking_time_uid, primary_key: :uid
end
