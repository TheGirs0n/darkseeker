extends EnemyStateTemplate
class_name PatrolState

@export var chase_state : ChaseState

var is_player_detected : bool = false

func update_state(delta : float):
	print("PATROL")
	if is_player_detected:
		current_state_machine.change_state(chase_state)


func _on_enemy_is_player_detected(is_player_detected: bool) -> void:
	self.is_player_detected = is_player_detected
