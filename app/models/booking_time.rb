class BookingTime < ApplicationRecord
  belongs_to :doctor, foreign_key: :doctor_uid, primary_key: :uid
  belongs_to :patient, foreign_key: :patient_uid, primary_key: :uid
end
