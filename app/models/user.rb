class User < ApplicationRecord
  has_person_name
  has_one_attached :avatar

  has_many :follows, dependent: :destroy
  has_many :engines
  has_many :service_records
  has_many :followed_tracks, through: :follows, source: :followable, source_type: 'Track'
  has_many :followed_championships, through: :follows, source: :followable, source_type: 'Championship'
  has_many :followed_events, through: :follows, source: :followable, source_type: 'Event'
  has_many :api_keys, dependent: :destroy

  validates :email, presence: true, format: { with: Devise.email_regexp }
  validates :first_name, :last_name, presence: true, length: { minimum: 2, maximum: 50 }
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def following?(followable)
    follows.exists?(followable: followable)
  end
  
  def manager?
    role == 'manager'
  end

  def managed_tracks
    Track.where(user_id: self)
  end

  def managed_championships
    Championship.where(user_id: self)
  end
end
