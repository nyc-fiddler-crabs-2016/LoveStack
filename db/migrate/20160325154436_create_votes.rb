class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.boolean :vote_status
      t.references :user, index: true, null: false
      t.references :voteable, index: true, polymorphic: true

      t.timestamps null: false
    end
  end
end
