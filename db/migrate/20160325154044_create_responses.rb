class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.text :content, null: false
      t.references :responsible, index: true, polymorphic: true, null:false
      t.references :user, index: true

      t.timestamps null: false
    end
  end
end
