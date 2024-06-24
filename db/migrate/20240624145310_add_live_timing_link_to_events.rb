class AddLiveTimingLinkToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :live_timing_link, :string
  end
end
