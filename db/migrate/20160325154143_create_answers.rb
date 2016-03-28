class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :content, null: false
      t.references :question, index: true, null: false
      t.references :user, index: true, null: false
      t.boolean :best, default: false

      t.timestamps null: false
    end
  end
end
