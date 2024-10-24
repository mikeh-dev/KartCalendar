class Addindextoapikkey < ActiveRecord::Migration[7.0]
  def change
    add_index :api_keys, :key, unique: true
  end
end