class AddMoreColsToChamps < ActiveRecord::Migration[7.0]
  def change
    add_column :championships, :tagline, :string
  end
end
