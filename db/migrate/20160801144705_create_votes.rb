class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :vote_event
      t.string :code
      t.string :user_id
      t.string :shop

      t.timestamps null: false
    end
  end
end
