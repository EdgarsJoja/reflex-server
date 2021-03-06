extends Node

class_name Player

var peer_id: int
var username: String = 'Anonymous'
var status: String = 'waiting'


func _ready():
	pass


func set_peer_id(value: int) -> Player:
	peer_id = value
	return self


func get_peer_id() -> int:
	return peer_id


func set_username(value: String) -> Player:
	username = value	
	return self


func get_username() -> String:
	return username


func set_status(value: String) -> Player:
	status = value	
	return self


func get_status() -> String:
	return status


func _to_string():
	return '%s (%s)' % [username, peer_id]
