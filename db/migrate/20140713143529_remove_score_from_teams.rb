class RemoveScoreFromTeams < ActiveRecord::Migration
  def change
    remove_column :teams, :score
  end
end
