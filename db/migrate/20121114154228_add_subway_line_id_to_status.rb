class AddSubwayLineIdToStatus < ActiveRecord::Migration
  def change
    add_column :statuses, :subway_line_id, :integer
  end
end
