extends Node

var start_checkpoint : Node3D
var current_checkpoint : Node3D


func _ready() -> void:
	current_checkpoint = start_checkpoint


func set_player_new_checkpoint(new_checkpoint : Node3D):
	current_checkpoint = new_checkpoint
	
