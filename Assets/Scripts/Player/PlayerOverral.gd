extends CharacterBody3D
class_name PlayerOverral

@export_group("Components")
@export var player_move_component : PlayerMoveComponent
@export var player_interact_component : PlayerInteractComponent
@export var player_charge_pool_component : PlayerChargePoolComponent
@export var player_flashlight_component : PlayerFlashlightComponent
@export var player_camera_look : PlayerCameraFreeLook


func set_controls_enable():
	player_move_component.set_physics_process(true)
	player_camera_look.set_process_input(true)


func set_controls_disable():
	player_move_component.set_physics_process(false)
	player_camera_look.set_process_input(false)
