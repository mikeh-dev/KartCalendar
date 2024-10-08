class Championship < ApplicationRecord
  has_many :events, dependent: :destroy
  has_one_attached :image
  has_one_attached :logo
  has_and_belongs_to_many :categories
  has_many :follows, as: :followable
  belongs_to :user, optional: true
  belongs_to :home_track, class_name: 'Track', foreign_key: 'home_track_id', optional: true

  validates :name, :description, :short_name, :long_name, presence: true
  validates :home_track_id, presence: true, if: -> { champ_type == 'Club' }

  store :social_media, accessors: [ :facebook, :instagram ]

  def next_champ_event
    events.where('start_date > ?', Date.current).order(start_date: :asc).first
  end
  
end