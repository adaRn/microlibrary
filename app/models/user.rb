class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :rentals
  has_many :users, through: :rentals
  devise :omniauthable, omniauth_providers: [:google_oauth2]

  def self.from_omniauth(access_token)
    user = User.find_by(uid: access_token['uid'],
                        provider: access_token['provider'])

    unless user
      user = User.create!(name: access_token.info['name'],
                          uid: access_token['uid'],
                          provider: access_token['provider'])
    end

    user
  end
end
