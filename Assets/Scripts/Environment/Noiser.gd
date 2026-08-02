extends StaticBody3D
class_name Noiser

@export var noise_area : Area3D
@export var lifetime_timer : Timer

var is_active : bool = false


func interact(interactor : CharacterBody3D):
	if is_active:
		return
	
	is_active = true
	lifetime_timer.start()
	

func _physics_process(delta: float) -> void:
	if not is_active:
		return
		
	for body in noise_area.get_overlapping_bodies():
		body.enemy_detect_component.check_hear(global_position)
		
		
func timer_timerout():
	is_active = false
