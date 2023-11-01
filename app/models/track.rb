class Track < ApplicationRecord
  has_many :events
  has_one_attached :main_image
  has_one_attached :logo
  has_one_attached :race_image
  has_one_attached :test_image
  has_one_attached :champ_image
  has_one_attached :contact_image
  store :social_media, accessors: [ :facebook, :instagram ]
end
