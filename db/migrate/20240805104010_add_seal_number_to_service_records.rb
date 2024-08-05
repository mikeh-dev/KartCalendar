class AddSealNumberToServiceRecords < ActiveRecord::Migration[7.0]
  def change
    add_column :service_records, :seal_number, :string
  end
end
