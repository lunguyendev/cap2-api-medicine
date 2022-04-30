class User < ApplicationRecord
  enum role: %i(patient doctor admin)
  enum status: %i(actived deactived)
  validates :email, presence: true, uniqueness: true
end
