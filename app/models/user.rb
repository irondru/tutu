class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable :trackable
  devise :database_authenticatable, :registerable,
         :confirmable, :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, format: { with: /\A\w{3,42}\z/i }

  has_many :tickets

end