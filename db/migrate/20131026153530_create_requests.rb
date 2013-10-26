class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.references :user
      t.references :question
      t.integer :time_limit
      t.timestamps
    end
  end
end
