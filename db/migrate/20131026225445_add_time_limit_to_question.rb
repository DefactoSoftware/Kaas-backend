class AddTimeLimitToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :time_limit, :string
  end
end
