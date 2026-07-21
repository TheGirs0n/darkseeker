extends Node3D
class_name EnemyMoveComponent


@export_group("Enemy Move Parameters")
@export var move_speed : float
@export var enemy_body : CharacterBody3D
@export var enemy_nav_agent : NavigationAgent3D


func move_to(next_position : Vector3):
	enemy_nav_agent.target_position = next_position
	var next = enemy_nav_agent.get_next_path_position()
	
	var dir = (next - global_position).normalized()
	
	enemy_body.velocity = dir * move_speed
	enemy_body.move_and_slide()
