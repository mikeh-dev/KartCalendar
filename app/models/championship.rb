class Championship < ApplicationRecord
  has_many :events, dependent: :destroy
end