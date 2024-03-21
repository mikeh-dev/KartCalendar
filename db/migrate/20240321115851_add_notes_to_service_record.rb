class AddNotesToServiceRecord < ActiveRecord::Migration[7.0]
  def change
    add_column :service_records, :notes, :text
  end
end
