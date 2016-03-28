class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.references :user, index: true, null: false

      t.timestamps null: false
    end
  end
end



# Create question
# If saves, then create a tag_question passing in question and tag.
