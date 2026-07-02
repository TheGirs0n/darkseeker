extends Node
class_name PlayerInteractComponent

@export_group("Interact RayCast")
@export var interact_raycast : RayCast3D
@export var player : CharacterBody3D

func _ready() -> void:
	interact_raycast.add_exception(player)


func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("interact"):
		interact_raycast.force_raycast_update()
		if interact_raycast.is_colliding():
			if interact_raycast.get_collider().has_method("interact"):
				interact_raycast.get_collider().interact()
