class AddSocialMediaToTracks < ActiveRecord::Migration[7.0]
  def change
    add_column :tracks, :facebook, :string
    add_column :tracks, :instagram, :string
    remove_column :tracks, :social_media, :string
  end
end
