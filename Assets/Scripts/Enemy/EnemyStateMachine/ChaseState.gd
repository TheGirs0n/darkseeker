extends EnemyStateTemplate
class_name ChaseState

@export var patrol_state : PatrolState
@export var enemy_move_component : EnemyMoveComponent

func update_state(delta : float):
	print("CHASE")
	var enemy = current_state_machine.parent_node
	if enemy.enemy_detect_component.last_seen_posiion != Vector3.ZERO:
		enemy.enemy_move_component.move_to(enemy.enemy_detect_component.last_seen_posiion)
	
	if !enemy.enemy_detect_component.check_player_detect():
		current_state_machine.change_state(patrol_state)
