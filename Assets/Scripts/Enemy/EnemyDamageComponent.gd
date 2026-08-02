extends Node3D
class_name EnemyDamageComponent


@export_group("Damage Parameters Config")
@export var visible_area : Area3D
@export var damage_timer : Timer
@export var damage_amount : int = 1

var player : PlayerOverral



func _on_damage_timer_timeout() -> void:
	player.player_health_component.take_damage(damage_amount)


func player_enter(body: Node3D) -> void:
	player = body as PlayerOverral
	damage_timer.start()
	

func player_exit(body: Node3D) -> void:
	player = null
	damage_timer.stop()
