class AddNameToEngines < ActiveRecord::Migration[7.0]
  def change
    add_column :engines, :name, :string
  end
end
