class ServiceRecord < ApplicationRecord
  belongs_to :user
  belongs_to :engine

  has_one_attached :invoice
  has_many_attached :dyno_sheets
  has_one_attached :logbook_stamp_image

  validates :date, :engine_builder, :new_seal_number, presence: true
  after_save :update_engine_seal_number

  private

  def update_engine_seal_number
    if new_seal_number.present?
      engine.update(seal_number: new_seal_number)
    end
  end
end