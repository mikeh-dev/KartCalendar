class AddUserIdToTracks < ActiveRecord::Migration[7.0]
  def change
    add_reference :tracks, :user, foreign_key: true
  end
end
