class Doctor < User
  has_many :schedule_times, foreign_key: :doctor_uid, primary_key: :uid
  has_many :available_times, foreign_key: :doctor_uid, primary_key: :uid
  has_many :booking_times, foreign_key: :doctor_uid, primary_key: :uid

  scope :find_doctors, -> (doctor_uids) { where("uid IN (?)", doctor_uids) }
end
