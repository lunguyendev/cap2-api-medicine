class Auth::Authentication
  def initialize(email, password)
    @email = email
    @password = password
    @authenticated_user = nil
  end

  attr_reader :authenticated_user

  def authenticable?
    return false unless current_user

    is_match = match_password?(
      hash_password: @current_user.hash_password,
      password: password
    )

    @authenticated_user = current_user if is_match

    is_match
  end

  private
    attr_reader :email, :password
    attr_writer :authenticated_user

    def current_user
      @current_user ||= User.find_by(email: email)
    end

    def match_password?(hash_password:, password:)
      BCrypt::Password.new(hash_password) == password
    end
end
