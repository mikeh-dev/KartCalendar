class Event < ApplicationRecord
  has_and_belongs_to_many :users, join_table: 'event_users'
  belongs_to :championship, optional: true

  has_one_attached :image

  def random_image_url
    Faker::LoremFlickr.image(size: "300x200", search_terms: ["event"])
  end

end
