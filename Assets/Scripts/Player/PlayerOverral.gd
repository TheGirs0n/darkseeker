extends CharacterBody3D
class_name PlayerOverral

@export_group("Components")
@export var player_component_list : Array[ComponentTemplate]
@export var player_move_component : PlayerMoveComponent
@export var player_interact_component : PlayerInteractComponent
@export var player_charge_pool_component : PlayerChargePoolComponent
@export var player_flashlight_component : PlayerFlashlightComponent
@export var player_camera_look : PlayerCameraFreeLook
@export var player_detect_component : PlayerDetectComponent
@export var player_health_component : PlayerHealthComponent


func _ready() -> void:
	CheckpointManager.set_checkpoint(global_transform)


func player_down() -> void:
	CheckpointManager.respawn(self)


func respawn_at(point : Transform3D):
	global_transform = point
	velocity = Vector3.ZERO
	player_health_component.restore()


func set_controls_enable():
	for component in player_component_list:
		component.set_process_enable()


func set_controls_disable():
	for component in player_component_list:
		component.set_process_disable()
