class Engine < ApplicationRecord
  belongs_to :user
  has_many :service_records

  has_many_attached :photos
end
