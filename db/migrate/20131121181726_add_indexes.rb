class AddIndexes < ActiveRecord::Migration
  def change
    add_index :user_categories, [:category_id, :user_id], unique: true
    add_index :requests, [:question_id, :user_id], unique: true
  end
end
