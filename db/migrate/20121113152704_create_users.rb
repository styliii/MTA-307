class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :number
      t.integer :subway_id

      t.timestamps
    end
  end
end
