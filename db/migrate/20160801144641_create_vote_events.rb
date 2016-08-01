class CreateVoteEvents < ActiveRecord::Migration
  def change
    create_table :vote_events do |t|
      t.string :code
      t.string :area
      t.integer :num_of_attends
      t.string :options

      t.timestamps null: false
    end
  end
end
