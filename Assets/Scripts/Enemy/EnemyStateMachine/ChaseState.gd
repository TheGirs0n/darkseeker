extends EnemyStateTemplate
class_name ChaseState

@export var patrol_state : PatrolState


func update_state(delta : float):
	var enemy = current_state_machine.parent_node
	if enemy.enemy_detect_component.last_seen_posiion != Vector3.ZERO:
		enemy.enemy_move_component.move_to(enemy.enemy_detect_component.last_seen_posiion, delta)
	
	if !enemy.enemy_detect_component.check_player_detect():
		current_state_machine.change_state(patrol_state)
