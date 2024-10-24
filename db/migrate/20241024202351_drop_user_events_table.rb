class DropUserEventsTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :event_users
  end
end