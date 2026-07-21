extends Node3D
class_name EnemyDetectComponent

@export_group("Vision Parameters")
@export var vision_area : Area3D
@export var eyes_position : Node3D

@export_group("Hear Timer")
@export var hear_timer : Timer

var seen_player : bool = false


func check_hear():
	hear_timer.start()


func check_vision() -> void:
	if vision_area.get_overlapping_bodies().is_empty():
		seen_player = false
	else:
		var player = vision_area.get_overlapping_bodies()[0] as PlayerOverral
		var space_state : PhysicsDirectSpaceState3D = get_world_3d().direct_space_state
		
		if player.player_detect_component.is_player_detected(eyes_position, space_state):
			seen_player = true
		else:
			seen_player = false


func check_player_detect() -> bool:
	return seen_player or not hear_timer.is_stopped()
