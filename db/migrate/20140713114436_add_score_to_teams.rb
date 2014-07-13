class AddScoreToTeams < ActiveRecord::Migration
  def up
    add_column :teams, :score, :integer, default: 0
  end

  def down
    remove_column :teams, :score
  end
end
