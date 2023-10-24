class AddMoreAtttoChamps < ActiveRecord::Migration[7.0]
  def change
    add_column :championship, :image, :string
    add_column :championship, :description, :text
    add_column :championship, :logo, :string
    add_column :championship, :price, :string
    add_column :championship, :type, :string
  end
end
