class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :jwt_authenticatable, jwt_revocation_strategy: Devise::JWT::RevocationStrategies::Null

  enum role: { admin: 1, guess: 2, developer: 3, employee: 4 }

  belongs_to :company
  has_many :assignments
  has_many :forms, through: :assignments
end
