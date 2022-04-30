class Api::V1::UserController < ApplicationController
  skip_before_action :authorize_request, only: :login
  include User::UserService
  include Util::Generation

  def login
    authenticator = Auth::Authentication.new(auth_params[:email], auth_params[:password])
    unless authenticator.authenticable?
      head :unauthorized
      return
    end

    render json: authenticator.authenticated_user, serializer: Api::V1::User::LoginSerializer
  end

  def logout
    head :ok
  end

  def change_password
    raise Errors::ExceptionHandler::InvalidAction unless match_password?(target_user.hash_password, param_change_password[:old_password])
    password_user = generate_hash_password(param_change_password[:new_password])
    target_user.update_attributes!(hash_password: password_user)

    head :accepted
  end

  def role
    render json: { role: @current_user.role }
  end

  def profile
    render json: @current_user, each_serializer: Api::V1::UserSerializer
  end

  def update
    save_user(param_user,target_user.doctor?, @user)

    head :accepted
  end

  def show
    render json: target_user, each_serializer: Api::V1::UserSerializer
  end

  private
    def auth_params
      params.permit(:email, :password)
    end

    def target_user
      @user ||= User.find(params[:uid])
    end

    def param_user
      params.permit(
        :name,
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
        :birthday
      )
    end

    def match_password?(hash_password, password)
      BCrypt::Password.new(hash_password) == password
    end

    def param_change_password
      params.permit(
        :old_password,
        :new_password
      )
    end
end
