class ServiceRecord < ApplicationRecord
  belongs_to :user
  belongs_to :engine

  has_one_attached :invoice
  has_many_attached :dyno_sheets

  validates :date, :description, presence: true

end
