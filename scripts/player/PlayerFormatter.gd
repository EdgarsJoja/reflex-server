extends Node

class_name PlayerFormatter


func _ready():
	pass


func to_json(player: Player) -> Dictionary:
	return {
		'network_id': player.get_peer_id(),
		'username': player.get_username()
	}
