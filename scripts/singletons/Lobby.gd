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


# Update existing player in lobby
func update_player(id, data: Dictionary) -> void:
	if players.has(id):
		var player: Player = players[id]
		
		for key in data.keys():
			match key:
				'username':
					player.set_username(data[key])
				'status':
					player.set_status(data[key])
				_:
					pass
		
		players[id] = player


# Get all lobby players
func get_players() -> Dictionary:
	return players
