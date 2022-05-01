class Api::V1::DoctorSerializer < ActiveModel::Serializer
  attributes \
    :uid,
    :email,
    :name,
    :type,
    :phone,
    :role,
    :major,
    :experience,
    :avatar
end
