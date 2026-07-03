extends Node
class_name PlayerFlashlightComponent

@export_group("Flashlight")
@export var flashlight : SpotLight3D

@export_group("Player Charge Component")
@export var player_charge_component : PlayerChargePoolComponent
@export var flashlight_charge_per_second : float


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("flashlight"):
		flashlight.visible = !flashlight.visible


func _process(delta: float) -> void:
	if player_charge_component.has_charge():
		player_charge_component.consume_charge(flashlight_charge_per_second * delta)

	if player_charge_component.is_empty():
		flashlight.visible = false
