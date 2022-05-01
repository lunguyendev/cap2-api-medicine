class Api::V1::ScheduleTimeSerializer < ActiveModel::Serializer
  attributes \
    :uid,
    :date,
    :start_time,
    :end_time

  belongs_to :doctor, serializer: Api::V1::DoctorSerializer
end
