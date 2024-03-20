class ServiceRecord < ApplicationRecord
  belongs_to :user
  belongs_to :engine

  has_one_attached :invoice
end
