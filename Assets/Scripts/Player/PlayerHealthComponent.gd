extends ComponentTemplate
class_name PlayerHealthComponent

@export_group("Health Parameters")
@export var max_health : int = 5


signal health_changed(current_health : int, max_health : int)
signal health_zero

var current_health : int


func _ready() -> void:
	current_health = max_health


func take_damage(damage_amount : int):
	if current_health <= 0:
		return 
		
	current_health = clampi(current_health - damage_amount, 0, max_health)
	health_changed.emit(current_health, max_health)
	
	if current_health <= 0:
		health_zero.emit()
		

func restore():
	current_health = max_health
	health_changed.emit(current_health, max_health)
