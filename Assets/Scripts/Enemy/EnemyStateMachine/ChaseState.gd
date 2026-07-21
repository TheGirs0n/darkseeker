extends EnemyStateTemplate
class_name ChaseState

@export var patrol_state : PatrolState
@export var enemy_move_component : EnemyMoveComponent

func update_state(delta : float):
	print("CHASE")
	if current_state_machine.parent_node.enemy_detect_component.last_seen_posiion != Vector3.ZERO:
		current_state_machine.parent_node.enemy_move_component.move_to(current_state_machine.parent_node.enemy_detect_component.last_seen_posiion)
	
	if !current_state_machine.parent_node.enemy_detect_component.check_player_detect():
		current_state_machine.change_state(patrol_state)
