extends EnemyStateTemplate
class_name ChaseState

@export var patrol_state : PatrolState

func update_state(delta : float):
	print("CHASE")
	if !current_state_machine.parent_node.enemy_detect_component.check_player_detect():
		current_state_machine.change_state(patrol_state)
