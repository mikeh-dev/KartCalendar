class CreateJoinTableCategoryChampionship < ActiveRecord::Migration[7.0]
  def change
    create_join_table :categories, :championships do |t|
      # t.index [:category_id, :championship_id]
      # t.index [:championship_id, :category_id]
    end
  end
end
