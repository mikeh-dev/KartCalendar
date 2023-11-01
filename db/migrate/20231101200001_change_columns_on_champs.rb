class ChangeColumnsOnChamps < ActiveRecord::Migration[7.0]
  def change
    remove_column :championships, :type, :string
    add_column :championships, :champ_type, :string
    change_column :championships, :price, :string
    change_column :championships, :test_fee, :string
    change_column :championships, :race_fee, :string
    change_column :championships, :champ_fee, :string
  end
end
