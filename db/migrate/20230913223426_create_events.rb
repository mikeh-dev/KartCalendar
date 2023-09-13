class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title, limit: 255
      t.text :description
      t.date :date
      t.decimal :price

      t.timestamps
    end
  end
end
