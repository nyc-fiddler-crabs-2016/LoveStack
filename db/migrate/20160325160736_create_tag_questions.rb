class CreateTagQuestions < ActiveRecord::Migration
  def change
    create_table :tag_questions do |t|
      t.references :question, index: true
      t.references :tag, index: true

      t.timestamps null: false
    end
  end
end
