class User < ApplicationRecord
  has_person_name
  has_one_attached :avatar

  has_and_belongs_to_many :events, join_table: 'event_users'

  validates :email, :first_name, :last_name, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
