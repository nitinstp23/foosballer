json.teams @teams.each do |team_number, players|
  json.name "Team #{team_number}"
  json.players players.each do |player|
    json.partial! 'api/players/player', player: player
  end
end
