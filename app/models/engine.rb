class Engine < ApplicationRecord
  belongs_to :user
  has_many :service_records

  has_many_attached :engine_photos
  has_many_attached :dyno_sheet
  has_one_attached :logbook_cover
end
