class CreateServiceRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :service_records do |t|
      t.references :user, null: false, foreign_key: true
      t.references :engine, null: false, foreign_key: true
      t.date :date
      t.text :description
      

      t.timestamps
    end
  end
end
