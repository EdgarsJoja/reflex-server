extends Node

var players = {}


func _ready():
	pass


# Add player to lobby
func add_player(id) -> void:
	var player = Player.new()
	player.set_peer_id(id)

	players[id] = player


# Remove player from lobby
func remove_player(id) -> void:
	players.erase(id)


# Get all lobby players
func get_players() -> Dictionary:
	return players
