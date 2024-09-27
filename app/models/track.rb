class Track < ApplicationRecord
  belongs_to :user, optional: true
  has_many :events
  has_many :follows, as: :followable, dependent: :destroy
  has_and_belongs_to_many :categories
  has_one :club_championship, -> { where(champ_type: 'Club') }, class_name: 'Championship', foreign_key: 'home_track_id'

  geocoded_by :address_for_geocoding

  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL }

  validates :name, length: { minimum: 2, maximum: 50 }, presence: true
  validates :address, :contact_number, :length, :description, :location, :short_desc, :website, presence: true

  has_one_attached :main_image
  has_one_attached :logo
  has_one_attached :race_image
  has_one_attached :test_image
  has_one_attached :champ_image
  has_one_attached :contact_image

  FACILITIES = ['Parking', 'Electric Hook-Up', 'Wi-Fi', 'Cafe', 'Kart Shop', 'Bar', 'Arrive & Drive Karting', 'Overnight Camping', 'Digital Timing Screen', 'Floodlights', 'Toilets'].freeze

  def next_race_event
    events.future_race_events.order(start_date: :asc).first
  end

  def next_test_event
    events.future_test_events.order(start_date: :asc).first
  end

  #began to refactor above here

  def future_events
    events.where('start_date >= ?', Date.today).order(start_date: :asc)
  end

  def race_events
    events.where(event_type: "Race")
  end

  def test_events
    events.where(event_type: "Test")
  end

  def address_for_geocoding
    address[-8..]
  end
end