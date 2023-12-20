class Championship < ApplicationRecord
  has_many :events, dependent: :destroy
  has_one_attached :image
  has_one_attached :logo
  has_and_belongs_to_many :categories


  validates :name, :description, :short_name, :long_name, presence: true

  has_many :follows, as: :followable
  
  has_many :events

  store :social_media, accessors: [ :facebook, :instagram ]

  def next_event
    events.where('date > ?', Time.current).order(date: :asc).first
  end
  
end