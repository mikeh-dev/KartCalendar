class User < ApplicationRecord
  has_person_name
  has_one_attached :avatar

  validates :email, :first_name, :last_name, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
