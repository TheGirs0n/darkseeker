extends ComponentTemplate
class_name PlayerHealthComponent

@export_group("Health Parameters")
@export var max_health : int = 5


signal player_get_damage(player_health : int)


var player_current_health : int


func _ready() -> void:
	player_current_health = max_health


func player_take_damage(damage_amount : int):
	player_current_health = clampi(player_current_health - damage_amount, 0, max_health)
	
	if player_current_health <= 0:
		pass
		
	player_get_damage.emit(player_current_health)
