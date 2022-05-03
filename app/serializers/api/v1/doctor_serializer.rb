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
    :birthday,
    :avatar,
    :national_id,
    :religion,
    :residential_address,
    :address,
    :national,
    :province,
    :district,
    :wards

end
