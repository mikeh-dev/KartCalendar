class Category < ApplicationRecord
  has_and_belongs_to_many :tracks
  has_and_belongs_to_many :events
  has_and_belongs_to_many :championships
end
