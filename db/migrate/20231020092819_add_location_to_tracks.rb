class AddLocationToTracks < ActiveRecord::Migration[7.0]
  def change
    add_column :tracks, :location, :string
  end
end
