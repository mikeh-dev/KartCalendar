class AddHomeTrackToChampionships < ActiveRecord::Migration[7.0]
  def change
    add_reference :championships, :home_track, foreign_key: { to_table: :tracks }
  end
end
