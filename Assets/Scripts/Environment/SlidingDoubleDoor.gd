extends Node3D
class_name SlidingDoubleDoor

@export_group("Sliding Double Doors")
@export var first_sliding_door : SlidingDoor
@export var second_sliding_door : SlidingDoor


func interact(interactor : CharacterBody3D):
	first_sliding_door.interact(interactor)
	second_sliding_door.interact(interactor)
