class AddLogoToTracks < ActiveRecord::Migration[7.0]
  def change
    add_column :tracks, :logo, :string
  end
end
