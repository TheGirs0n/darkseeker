extends EnemyStateTemplate
class_name PatrolState

@export var chase_state : ChaseState

var patrol_index : int = 0

func update_state(delta : float):
	print("PATROL")
	
	var enemy = current_state_machine.parent_node
	
	if enemy.enemy_detect_component.check_player_detect():
		current_state_machine.change_state(chase_state)
		return
		
	if enemy.patrol_points.is_empty():
		return
		
	enemy.enemy_move_component.move_to(enemy.patrol_points[patrol_index].global_position, delta)
	
	if enemy.enemy_move_component.is_arrived():
		patrol_index = (patrol_index + 1) % enemy.patrol_points.size()
