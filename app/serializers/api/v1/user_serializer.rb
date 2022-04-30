class Api::V1::UserSerializer < ActiveModel::Serializer
  attributes \
    :uid,
    :email,
    :name,
    :type,
    :phone,
    :status,
    :birthday,
    :role,
    :major,
    :experience,
    :national_id,
    :religion,
    :residential_address,
    :address,
    :national,
    :province,
    :district,
    :wards,
    :avatar
end
