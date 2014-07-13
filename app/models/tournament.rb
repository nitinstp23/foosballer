class Tournament < ActiveRecord::Base

  has_many :teams
  has_many :games

  accepts_nested_attributes_for :teams
  accepts_nested_attributes_for :games

  after_create :build_games

  def played_on
    @played_on ||= self.created_at.to_date
  end

  private

  def build_games
    team_ids_group = self.team_ids.combination(2).to_a.shuffle

    self.games_attributes = team_ids_group.each_with_index.map do |team_ids, i|
      {
        team_one_id: team_ids.first,
        team_two_id: team_ids.last,
        team_one_score: 0,
        team_two_score: 0,
        position: i+1
      }
    end

    self.save!
  end

end
