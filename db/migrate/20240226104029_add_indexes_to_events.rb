class AddIndexesToEvents < ActiveRecord::Migration[7.0]
  def change
    add_index :events, :start_date
    add_index :events, :end_date
  end
end
