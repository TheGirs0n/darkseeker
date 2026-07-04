extends CharacterBody3D
class_name PlayerOverral

@export_group("Components")
@export var player_component_list : Array[ComponentTemplate]
@export var player_move_component : PlayerMoveComponent
@export var player_interact_component : PlayerInteractComponent
@export var player_charge_pool_component : PlayerChargePoolComponent
@export var player_flashlight_component : PlayerFlashlightComponent
@export var player_camera_look : PlayerCameraFreeLook


func set_controls_enable():
	for i in player_component_list:
		i.set_process_enable()


func set_controls_disable():
	for i in player_component_list:
		i.set_process_disable()
