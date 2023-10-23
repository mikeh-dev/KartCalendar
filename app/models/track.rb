class Track < ApplicationRecord
  has_many :events
  has_one_attached :main_image

end
