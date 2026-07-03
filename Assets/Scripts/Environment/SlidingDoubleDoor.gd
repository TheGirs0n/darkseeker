extends Node3D
class_name SlidingDoubleDoor

@export_group("Sliding Double Doors")
@export var first_sliding_door : SlidingDoor
@export var second_sliding_door : SlidingDoor


func interact():
	first_sliding_door.interact()
	second_sliding_door.interact()
