class AddIndexToTracksName < ActiveRecord::Migration[7.0]
  def change
    add_index :tracks, :name
  end
end