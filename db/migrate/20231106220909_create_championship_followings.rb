class CreateChampionshipFollowings < ActiveRecord::Migration[7.0]
  def change
    create_table :championship_followings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :championship, null: false, foreign_key: true

      t.timestamps
    end
  end
end
