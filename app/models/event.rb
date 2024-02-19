class Event < ApplicationRecord
  has_and_belongs_to_many :users, join_table: 'event_users'
  belongs_to :championship, optional: true
  belongs_to :track
  has_and_belongs_to_many :categories

  validates :start_date, :end_date, presence: true
  validate :end_date_after_start_date

  has_many :follows, as: :followable, dependent: :destroy

  validates :title, :description, :price, :event_type, :track_id, presence: true
  has_one_attached :image

  def random_image_url
    Faker::LoremFlickr.image(size: "300x200", search_terms: ["event"])
  end

  scope :upcoming_based_on_date, -> { where("start_date > ?", Date.today).order("start_date ASC") }

  def self.next_based_on_date
    upcoming_based_on_date.first
  end

  def self.followed_by(user)
    followed_event_ids = user.follows.where(followable_type: 'Event').pluck(:followable_id)
    where(id: followed_event_ids)
  end

  def start_time
    self.start_date.to_datetime
  end

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end

  scope :starting_within_next_six_days, -> { where(start_date: Date.today..(Date.today + 6.days)) }

end