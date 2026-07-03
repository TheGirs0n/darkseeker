extends Node
class_name PlayerChargePoolComponent


@export_group("Charge Pool Parameters")
@export var _max_charge : float = 100
@export var _current_charge : float = 0

signal charge_changed(_current_charge : float, _max_charge : float)

func _ready() -> void:
	_current_charge = _max_charge


func consume_charge(charge_to_change : float):
	_current_charge = clamp(_current_charge - charge_to_change, 0, _max_charge)

	if _current_charge == 0:
		print("Charge is 0")
	charge_changed.emit(_current_charge, _max_charge)


func has_charge() -> bool:
	return _current_charge > 0


func is_empty() -> bool:
	return _current_charge == 0
