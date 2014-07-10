class CreateGameSessions < ActiveRecord::Migration
  def change
    create_table :game_sessions do |t|
      t.integer :player_id, null: false
      t.integer :team_id, null: false

      t.timestamps
    end
    add_index :game_sessions, [:player_id, :team_id], unique: true
  end
end
