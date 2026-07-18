extends Node3D
class_name Enemy

@export_group("Vision Parameters")
@export var vision_area : Area3D
@export var eyes_position : Node3D

@export_group("State Machine")
@export var enemy_state_machine : StateMachine

signal is_player_detected(is_player_detected : bool)

var last_seen_position : Vector3 = Vector3.ZERO

func hear():
	is_player_detected.emit(true)


func check_vision() -> void:
	if vision_area.get_overlapping_bodies().is_empty():
		pass
	else:
		var player = vision_area.get_overlapping_bodies()[0] as PlayerOverral
		var space_state : PhysicsDirectSpaceState3D = get_world_3d().direct_space_state
		
		if player.player_detect_component.is_player_detected(eyes_position, space_state):
			is_player_detected.emit(true)
		else:
			is_player_detected.emit(false)
