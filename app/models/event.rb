class Event < ApplicationRecord
  has_and_belongs_to_many :users, join_table: 'event_users'
  belongs_to :championship, optional: true
  belongs_to :track

  has_many :follows, as: :followable, dependent: :destroy

  validates :title, :description, :date, :price, :event_type, :track_id, presence: true
  has_one_attached :image

  def random_image_url
    Faker::LoremFlickr.image(size: "300x200", search_terms: ["event"])
  end

  scope :upcoming_based_on_date, -> { where("date > ?", Date.today).order("date ASC") }

  def self.next_based_on_date
    upcoming_based_on_date.first
  end

  def self.followed_by(user)
    followed_event_ids = user.follows.where(followable_type: 'Event').pluck(:followable_id)
    where(id: followed_event_ids)
  end
end