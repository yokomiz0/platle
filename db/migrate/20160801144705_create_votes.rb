class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :vote_event
      t.string :user_id
      t.references :shop

      t.timestamps null: false
    end
  end
end
