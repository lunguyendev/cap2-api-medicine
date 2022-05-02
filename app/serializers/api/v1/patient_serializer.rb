class Api::V1::PatientSerializer < ActiveModel::Serializer
  attributes \
    :uid,
    :email,
    :name,
    :type,
    :phone,
    :role,
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
