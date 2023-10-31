class AddDeetsToChamps < ActiveRecord::Migration[7.0]
    def change
      add_column :championships, :contact_number, :string
      add_column :championships, :mobile, :string
      add_column :championships, :website, :string
      add_column :championships, :email, :string
      add_column :championships, :short_name, :string
      add_column :championships, :long_name, :string
      add_column :championships, :test_fee, :decimal
      add_column :championships, :race_fee, :decimal
      add_column :championships, :champ_fee, :decimal
    end
end
