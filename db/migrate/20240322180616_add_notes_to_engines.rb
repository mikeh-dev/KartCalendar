class AddNotesToEngines < ActiveRecord::Migration[7.0]
  def change
    add_column :engines, :notes, :text
  end
end
