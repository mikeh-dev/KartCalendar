class AddEngineBuilderToServiceRecord < ActiveRecord::Migration[7.0]
  def change
    add_column :service_records, :engine_builder, :string
  end
end
