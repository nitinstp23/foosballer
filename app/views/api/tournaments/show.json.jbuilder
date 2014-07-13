json.id @tournament.id
json.played_on @tournament.played_on

json.teams @tournament.teams do |team|
  json.id team.id

  json.players team.players do |player|
    json.partial! 'api/players/player', player: player
  end
end
