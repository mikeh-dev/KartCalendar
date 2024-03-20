class AddLicenceToChampionships < ActiveRecord::Migration[7.0]
  def change
    add_column :championships, :licence, :string
  end
end
