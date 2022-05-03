class Api::V1::Patient::UserController < PatientController
  skip_before_action :authorize_request, only: :create
  include User::UserService
  def list_doctor
    doctor = Doctor.all.order("email ASC")

    render json: doctor, each_serializer: Api::V1::UserSerializer
  end

  def create
    save_user(param_create, is_doctor=false)

    head :created
  end

  private
    def param_create
      params.permit(
        :name,
        :email,
        :password,
        :phone,
      )
    end
end
