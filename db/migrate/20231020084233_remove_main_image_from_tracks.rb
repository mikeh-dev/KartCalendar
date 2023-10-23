class RemoveMainImageFromTracks < ActiveRecord::Migration[6.1]
  def change
    remove_column :tracks, :main_image, :string
  end
end