class Track < ApplicationRecord
  has_many :events
  has_many :follows, as: :followable, dependent: :destroy

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

  def future_events
    events.where('date >= ?', Date.today).order(date: :asc)
  end

  def race_events
    events.where(event_type: "Race")
  end

  def test_events
    events.where(event_type: "Test")
  end

  def next_event
    future_events.first
  end

  def next_race_event
    race_events.first
  end

  def next_test_event
    test_events.first
  end
end