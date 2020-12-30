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

	clients_update_lobby()


func player_disconnected(id) -> void:
	print("player (%s) disconnected" % id)
	Lobby.remove_player(id)

	clients_update_lobby()


remote func update_player_data(data: Dictionary) -> void:
	var sender_id = get_tree().get_rpc_sender_id()
	
	Lobby.update_player(sender_id, data)
	print("player (%s) data updated: %s" % [sender_id, data])
	
	clients_update_lobby()


func clients_update_lobby():	
	var lobbyJsonDecorator = LobbyJsonDecorator.new()
	rpc('update_lobby', lobbyJsonDecorator.get_players())

