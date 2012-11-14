class ChangeColumn < ActiveRecord::Migration
  def up
    rename_column :users, :subway_id, :subway_line_id
  end

  def down
  end
end
