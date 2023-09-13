class Event < ApplicationRecord
  has_and_belongs_to_many :users, join_table: 'event_users'
  


end
