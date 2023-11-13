class CreateTrackFollowings < ActiveRecord::Migration[7.0]
  def change
    create_table :track_followings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :track, null: false, foreign_key: true

      t.timestamps
    end
    
    add_index :track_followings, [:user_id, :track_id], unique: true

  end
end