extends Node3D
class_name EnemyMoveComponent

const GRAVITY_FORCE : float = 9.8

@export_group("Enemy Move Parameters")
@export var move_speed : float
@export var enemy_body : CharacterBody3D
@export var enemy_nav_agent : NavigationAgent3D


func move_to(next_position : Vector3, delta : float):
	enemy_nav_agent.target_position = next_position
	var next = enemy_nav_agent.get_next_path_position()
	
	var dir : Vector3 = next - enemy_body.global_position
	dir.y = 0
	dir = dir.normalized()
	
	enemy_body.velocity.x = dir.x * move_speed
	enemy_body.velocity.z = dir.z * move_speed
	
	if not enemy_body.is_on_floor():
		enemy_body.velocity.y -= GRAVITY_FORCE * delta
	
	enemy_body.move_and_slide()
	
	if dir.length() > 0.01:
		enemy_body.rotation.y = atan2(-dir.z, dir.x)


func is_arrived() -> bool:
	return enemy_nav_agent.is_navigation_finished()
