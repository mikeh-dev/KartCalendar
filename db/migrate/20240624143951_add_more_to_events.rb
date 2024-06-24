class AddMoreToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :member_entry_fee, :string
    add_column :events, :non_member_entry_fee, :string
    add_column :events, :arrival_instructions, :text
    add_column :events, :nominated_fuel_station, :text
    add_column :events, :paddock_booking_contact, :string
  end
end
