class ChangeDateToRangeInEvents < ActiveRecord::Migration[6.0]
  def change
    remove_column :events, :date, :date
    add_column :events, :start_date, :date
    add_column :events, :end_date, :date
  end
end