class CreateVoteEvents < ActiveRecord::Migration
  def change
    create_table :vote_events do |t|
      t.string :code
      t.string :area
      t.integer :num_of_people
      t.string :options # "1,2,3"
      t.integer :max_vote, default: 5
      t.timestamps null: false
    end
  end
end
