class AvailableTime < ApplicationRecord
  belongs_to :doctor, foreign_key: :doctor_uid, primary_key: :uid
end
