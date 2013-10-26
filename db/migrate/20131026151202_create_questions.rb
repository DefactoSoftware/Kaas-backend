class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :question
      t.integer :user_answer_id
      t.text :answer
      t.references :user
      t.references :category
      t.timestamps
    end
  end
end
