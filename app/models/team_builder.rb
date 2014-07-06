class TeamBuilder

  attr_reader :teams

  def initialize(player_ids)
    @player_ids = player_ids || []
  end

  def valid?
    (@player_ids.size > 0) && (@player_ids.size % 2 == 0)
  end

  # teams = {
  #   "1" => [player_1, player_4],
  #   "2" => [player_5, player_3],
  #   "3" => [player_2, player_6],
  # }
  def teams
    teams       = {}
    team_number = 0
    players     = fetch_players.to_a

    begin
      team_number += 1
      players.shuffle!
      teams[team_number.to_s] = players.pop(2)
    end while(players.size > 0)

    teams
  end

  private

  def fetch_players
    Player.where(id: @player_ids)
  end

end
