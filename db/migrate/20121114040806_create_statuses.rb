class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :name
      t.string :status
      t.datetime :posted_date
      t.text :description

      t.timestamps
    end
  end
end
