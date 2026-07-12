extends Node

var robot_parts_collected : int = 0

signal robot_parts_count_changed(count : int)


func add_robot_part():
	robot_parts_collected += 1
	robot_parts_count_changed.emit(robot_parts_collected)
	print(robot_parts_collected)
