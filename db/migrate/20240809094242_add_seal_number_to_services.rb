class AddSealNumberToServices < ActiveRecord::Migration[7.0]
  def change
    add_column :service_records, :new_seal_number, :string
    add_column :service_records, :old_seal_number, :string
    remove_column :service_records, :seal_number, :string
  end
end
