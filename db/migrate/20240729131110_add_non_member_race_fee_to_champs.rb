class AddNonMemberRaceFeeToChamps < ActiveRecord::Migration[7.0]
  def change
    add_column :championships, :non_member_race_fee, :string
  end
end
