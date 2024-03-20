class User < ApplicationRecord
  has_person_name
  has_one_attached :avatar

  has_and_belongs_to_many :events, join_table: 'event_users'

  has_many :follows, dependent: :destroy

  has_many :engines

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :first_name, :last_name, presence: true, length: { minimum: 2, maximum: 50 }
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def following?(followable)
    follows.exists?(followable: followable)
  end

  def followed_championships
    Championship.joins(:follows).where(follows: { user_id: id })
  end
      
  def followed_tracks
    Track.joins(:follows).where(follows: { user_id: id })
  end

  def followed_events
    Event.joins(:follows).where(follows: { user_id: id })
  end

end