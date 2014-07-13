class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :tournament_id, null: false

      t.integer :team_one_id, null: false
      t.integer :team_two_id, null: false

      t.integer :team_one_score, null: false
      t.integer :team_two_score, null: false

      t.integer :winner_id

      t.integer :position, null: false

      t.timestamps
    end

    add_index :games, :tournament_id
  end
end
