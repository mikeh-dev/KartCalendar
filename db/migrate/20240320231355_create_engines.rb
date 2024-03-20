class CreateEngines < ActiveRecord::Migration[7.0]
  def change
    create_table :engines do |t|
      t.string :engine_number, index: true
      t.string :engine_make
      t.string :engine_model
      t.string :barrel_number
      t.string :seal_number
      t.string :year_manufactured
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
