class Api::V1::PrescriptionSerializer < ActiveModel::Serializer
  attributes \
    :uid,
    :note,
    :created_at

  belongs_to :patient, serializer: Api::V1::PatientSerializer
  belongs_to :doctor, serializer: Api::V1::DoctorSerializer
end
