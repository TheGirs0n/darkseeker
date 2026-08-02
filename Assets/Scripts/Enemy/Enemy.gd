extends CharacterBody3D
class_name Enemy


@export_group("Enemy Components")
@export var enemy_detect_component : EnemyDetectComponent
@export var enemy_move_component : EnemyMoveComponent

@export_group("Patrol")
@export var patrol_points : Array[Marker3D]


func forget_player():
	enemy_detect_component.forget_player()
