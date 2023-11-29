class User < ApplicationRecord
  has_person_name
  has_one_attached :avatar

  has_and_belongs_to_many :events, join_table: 'event_users'

  has_many :follows

  validates :email, :first_name, :last_name, presence: true
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

  private

    def follow_events_of_championships
      championships.each do |championship|
        championship.events.each do |event|
          events << event unless events.include?(event)
        end
      end
    end
end
