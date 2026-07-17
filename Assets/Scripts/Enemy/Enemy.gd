extends Node3D
class_name Enemy

@export var vision_area : Area3D

func hear():
	print("HEARD")


func check_vision() -> void:
	if vision_area.get_overlapping_bodies().is_empty():
		return
	else:
		print("SEEN: ")
