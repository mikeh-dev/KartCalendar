class AddUserToChampionships < ActiveRecord::Migration[7.0]
  def change
    add_reference :championships, :user, foreign_key: true
  end
end
