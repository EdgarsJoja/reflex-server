extends Node

export var port = 9009
export var max_players = 4


func _ready():
	# Initialize server
	var peer = NetworkedMultiplayerENet.new()
	peer.create_server(port, max_players)
	get_tree().network_peer = peer

	# warning-ignore:return_value_discarded
	get_tree().connect("network_peer_connected", self, "player_connected")
	# warning-ignore:return_value_discarded
	get_tree().connect("network_peer_disconnected", self, "player_disconnected")

	if peer:
		print('Server ready')



func player_connected(id) -> void:
	print("player (%s) connected" % id)
	Lobby.add_player(id)

	rpc('update_lobby', Lobby.get_players())


func player_disconnected(id) -> void:
	print("player (%s) disconnected" % id)
	Lobby.remove_player(id)

	rpc('update_lobby', Lobby.get_players())
