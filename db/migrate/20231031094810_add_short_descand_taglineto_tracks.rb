class AddShortDescandTaglinetoTracks < ActiveRecord::Migration[7.0]
  def change
    add_column :tracks, :short_desc, :string
    add_column :tracks, :tagline, :string
    add_column :tracks, :facilities, :string, array: true, default: []
    add_column :tracks, :website, :string
    add_column :tracks, :static_map_url, :string
    add_column :tracks, :social_media, :text
  end
end
