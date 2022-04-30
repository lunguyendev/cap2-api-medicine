class Api::V1::Admin::UserController < AdminController
  include User::UserService
  def list_patient
    patient = Patient.all.order("email ASC")

    render json: patient, each_serializer: Api::V1::UserSerializer
  end

  def list_doctor
    doctor = Doctor.all.order("email ASC")

    render json: doctor, each_serializer: Api::V1::UserSerializer
  end

  def ban
    raise Errors::ExceptionHandler::InvalidAction if target_user.deactived?

    target_user.deactived!
    head :accepted
  end

  def unban
    raise Errors::ExceptionHandler::InvalidAction if target_user.actived?

    target_user.actived!
    head :accepted
  end

  def count_user
    users = User.not_admin.count
    render json: { count_user: users }, status: :ok
  end

  def create_doctor
    save_user(param_create_doctor, is_doctor=true)

    head :created
  end

  def create_patient
    save_user(param_create_doctor, is_doctor=false)

    head :created
  end

  def destroy
    target_user.destroy!

    return head :accepted
  end

  private
    def target_user
      @user ||= User.find(params[:uid])
    end

    def param_create_doctor
      params.permit(
        :name,
        :email,
        :password,
        :phone,
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
        :birthday,
      )
    end

    def param_create_patient
      params.permit(
        :name,
        :email,
        :password,
        :phone,
        :national_id,
        :religion,
        :residential_address,
        :address,
        :national,
        :province,
        :district,
        :wards,
        :birthday,
      )
    end
end
