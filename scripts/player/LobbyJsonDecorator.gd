extends Node

class_name LobbyJsonDecorator


func _ready():
	pass


func get_players() -> Array:
	var players = Lobby.get_players().values()
	var result = []
	var playerFormatter = PlayerFormatter.new()

	for player in players:
		result.append(playerFormatter.to_json(player))

	return result
