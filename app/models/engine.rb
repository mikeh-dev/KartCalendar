class Engine < ApplicationRecord
  belongs_to :user
  has_many :service_records, dependent: :nullify

  has_many_attached :engine_images
  has_one_attached :logbook_cover

  validates :name, :engine_number, :engine_make, :engine_model, :year_manufactured, :barrel_number, :seal_number, presence: true

  def display_name
    "#{name} - #{engine_number}"
  end
end 