class AddTrackToEvent < ActiveRecord::Migration[7.0]
  def change
    add_reference :events, :track, foreign_key: true
  end
end
