extends EnemyStateTemplate
class_name PatrolState

@export var chase_state : ChaseState

func update_state(delta : float):
	print("PATROL")
	if current_state_machine.parent_node.enemy_detect_component.check_player_detect():
		current_state_machine.change_state(chase_state)
