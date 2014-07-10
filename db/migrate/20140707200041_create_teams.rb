class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name, null: false
      t.integer :tournament_id, null: false

      t.timestamps
    end
    add_index :teams, :tournament_id
  end
end
