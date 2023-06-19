class User < ApplicationRecord
  has_one :cart
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  def admin?
    is_admin
  end

end
