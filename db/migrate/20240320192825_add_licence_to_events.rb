class AddLicenceToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :licence, :string
  end
end
