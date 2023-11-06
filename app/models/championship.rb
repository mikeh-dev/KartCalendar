class Championship < ApplicationRecord
  has_many :events, dependent: :destroy
  has_one_attached :image
  has_one_attached :logo

  has_many :championship_followings
  has_many :users, through: :championship_followings
  has_many :events

  store :social_media, accessors: [ :facebook, :instagram ]
end