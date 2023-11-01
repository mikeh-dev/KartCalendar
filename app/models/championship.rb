class Championship < ApplicationRecord
  has_many :events, dependent: :destroy
  has_one_attached :image
  has_one_attached :logo
  store :social_media, accessors: [ :facebook, :instagram ]
end