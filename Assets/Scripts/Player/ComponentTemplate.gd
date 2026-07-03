extends Node
class_name ComponentTemplate


func set_process_enable():
	set_process(true)
	set_physics_process(true)
	set_process_input(true)
	
	
func set_process_disable():
	set_process(false)
	set_physics_process(false)
	set_process_input(false)
