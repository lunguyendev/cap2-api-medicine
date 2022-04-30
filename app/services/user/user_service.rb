module User::UserService
  include Util::Generation

  def save_user(param, is_doctor, user=nil)
    hash_password = generate_hash_password(param["password"])
    param.delete(:password)
    if user
      user.update!(param)
    else
      param["hash_password"] = hash_password
      if is_doctor
        param["role"] = "doctor"
        Doctor.create!(param)
      else
        param["role"] = "patient"
        Patient.create!(param)
      end
    end
  end
end
