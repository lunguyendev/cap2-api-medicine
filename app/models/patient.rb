class Patient < User
  has_many :booking_times, foreign_key: :patient_uid, primary_key: :uid
  has_many :prescriptions, foreign_key: :patient_uid, primary_key: :uid
end
