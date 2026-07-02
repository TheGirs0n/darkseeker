extends Node
class_name PlayerInteractComponent

@export_group("Interact RayCast")
@export var interact_raycast : RayCast3D
@export var player : CharacterBody3D

func _ready() -> void:
	interact_raycast.add_exception(player)


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		interact_raycast.force_raycast_update()
		if interact_raycast.is_colliding():
			var interact_item = interact_raycast.get_collider()
			if interact_item.has_method("interact"):
				interact_item.interact()
