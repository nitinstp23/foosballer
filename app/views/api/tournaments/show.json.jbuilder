json.id @tournament.id
json.played_on @tournament.played_on

json.games @tournament.games do |game|
  json.id game.id
  json.team_one_id game.team_one_id
  json.team_one_name game.team_one_name
  json.team_one_score game.team_one_score
  json.team_two_id game.team_two_id
  json.team_two_name game.team_two_name
  json.team_two_score game.team_two_score
  json.position game.position
end

json.teams @tournament.teams do |team|
  json.id team.id
  json.name team.name

  json.players team.players do |player|
    json.partial! 'api/players/player', player: player
  end
end
