class User < ApplicationRecord
  has_one :cart
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :zip_code, format: { with: /\A\d+\z/, message: "should only contain numbers" }, on: [:create, :update]

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

end
