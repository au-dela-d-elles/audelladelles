class User < ApplicationRecord
    devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
    after_create :welcome_send 

    def welcome_send
      UserMailer.welcome_email(self).deliver_now
    end
end
