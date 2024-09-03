class Changeservicerecordstonullable < ActiveRecord::Migration[7.0]
  def change
    change_column_null :service_records, :engine_id, true
  end
end