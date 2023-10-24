class AddMoreAtttoChamps < ActiveRecord::Migration[7.0]
  def change
    add_column :championships, :image, :string
    add_column :championships, :description, :text
    add_column :championships, :logo, :string
    add_column :championships, :price, :string
    add_column :championships, :type, :string
  end
end
