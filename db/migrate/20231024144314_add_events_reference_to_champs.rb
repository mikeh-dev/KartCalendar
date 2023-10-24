class AddEventsReferenceToChamps < ActiveRecord::Migration[7.0]
  def change
    add_reference :championships, :event, foreign_key: true
  end
end
