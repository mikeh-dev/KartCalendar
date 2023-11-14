class DropFollowingsTables < ActiveRecord::Migration[7.0]
  def change
    drop_table :championship_followings
    drop_table :track_followings
  end
end