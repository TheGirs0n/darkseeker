extends EnemyStateTemplate
class_name PatrolState

var is_player_detected : bool = false

func update_state(delta : float):
	if is_player_detected:
		#current_state_machine.change_state(current_state_machine.states_array.)
		pass


func _on_enemy_is_player_detected(is_player_detected: bool) -> void:
	self.is_player_detected = is_player_detected
