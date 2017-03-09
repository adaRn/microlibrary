class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :rentals
  has_many :users, through: :rentals
  devise :omniauthable, omniauth_providers: [:google_oauth2]
end
