class CreateTrack < ActiveRecord::Migration[7.0]
  def change
    create_table :tracks do |t|
      t.string :name
      t.string :address
      t.string :contact_number
      t.string :main_image
      t.integer :length
      t.string :email

      t.timestamps
    end
  end
end
