class CreateJoinTableCategoryTrack < ActiveRecord::Migration[7.0]
  def change
    create_join_table :categories, :tracks do |t|
      # t.index [:category_id, :track_id]
      # t.index [:track_id, :category_id]
    end
  end
end
