class Api::V1::Patient::BookingTimeSerializer < ActiveModel::Serializer
  attributes \
    :uid,
    :date,
    :start_time,
    :end_time,
    :link_meeting

  belongs_to :patient, serializer: Api::V1::PatientSerializer
end
