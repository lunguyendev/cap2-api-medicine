class Api::V1::BookingTimeSerializer < ActiveModel::Serializer
  attributes \
    :uid,
    :date,
    :start_time,
    :end_time,
    :link_meeting

  belongs_to :doctor, serializer: Api::V1::DoctorSerializer
end
