class Api::V1::Patient::UserController < PatientController
  include User::UserService
  def list_doctor
    doctor = Doctor.all.order("email ASC")

    render json: doctor, each_serializer: Api::V1::UserSerializer
  end
end
