class Token < ActiveRecord::Base
  include Util::Generation

  before_validation(on: :create) do
    self.qr_code_string = generate_token
  end
end
