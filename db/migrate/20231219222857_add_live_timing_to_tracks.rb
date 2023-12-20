class AddLiveTimingToTracks < ActiveRecord::Migration[7.0]
  def change
    add_column :tracks, :live_timing, :string
    add_column :tracks, :track_surface, :string
  end
end
