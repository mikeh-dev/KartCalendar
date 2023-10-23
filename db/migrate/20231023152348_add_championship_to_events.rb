class AddChampionshipToEvents < ActiveRecord::Migration[7.0]
  def change
    add_reference :events, :championship, foreign_key: true
  end
end
