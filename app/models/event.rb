class Event < ApplicationRecord
  belongs_to :championship, optional: true
  belongs_to :track

  has_and_belongs_to_many :categories

  has_many :follows, as: :followable, dependent: :destroy
  has_many :followers, through: :follows, source: :user
  has_one_attached :image

  validates :start_date, :end_date, :title, :description, :event_type, :track_id, presence: true
  validate :end_date_after_start_date

  scope :future_events, -> { where('start_date >= ?', Date.today).order(:start_date) }
  scope :past_events, -> { where('end_date < ?', Date.today).order(start_date: :desc) }
  scope :future_race_events, -> { future_events.where(event_type: 'Race') }
  scope :future_test_events, -> { future_events.where(event_type: 'Test') }
  scope :this_weekends_events, -> { future_events.where('end_date >= ? AND end_date <= ?', Date.today, Date.today + 7.days).includes(:track) }
  scope :next_week_events, -> { future_events.where('start_date >= ?', Date.today + 7.days) }
  scope :on_date, -> (date) { where('start_date <= ? AND end_date >= ?', date, date) }
  scope :by_category, ->(category_id) { joins(:categories).where(categories: { id: category_id }) }
  scope :by_event_type, ->(event_type) { where(event_type: event_type) }

  def self.followed_by(user)
    followed_event_ids = user.follows.where(followable_type: 'Event').pluck(:followable_id)
    where(id: followed_event_ids)
  end

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end
end