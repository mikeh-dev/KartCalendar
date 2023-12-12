class Track < ApplicationRecord
  has_many :events
  has_many :follows, as: :followable, dependent: :destroy

  validates :name, length: { minimum: 2, maximum: 50 }, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :address, :contact_number, :length, :description, :location, :short_desc, :website, presence: true

  has_one_attached :main_image
  has_one_attached :logo
  has_one_attached :race_image
  has_one_attached :test_image
  has_one_attached :champ_image
  has_one_attached :contact_image
  store :social_media, accessors: [ :facebook, :instagram ]
end