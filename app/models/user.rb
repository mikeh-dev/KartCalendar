class User < ApplicationRecord
  has_person_name
  has_one_attached :avatar

  has_and_belongs_to_many :events, join_table: 'event_users'

  has_many :championship_followings
  has_many :championships, through: :championship_followings

  after_create :follow_events_of_championships



  validates :email, :first_name, :last_name, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  private

    def follow_events_of_championships
      championships.each do |championship|
        championship.events.each do |event|
          events << event unless events.include?(event)
        end
      end
    end

end
