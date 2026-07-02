extends AnimatableBody3D
class_name SlidingDoor

@export_group("Sliding Door Parameters")
@export var target_offset : Vector3 

var is_open : bool = false
var slide_tween : Tween

func interact():
	is_open = !is_open
	change_door_position(is_open)
	

func change_door_position(is_open : bool):
	var side = 1 if is_open == true else -1
	
	if slide_tween:
		slide_tween.kill()
		
	slide_tween = create_tween()
	slide_tween.set_ease(Tween.EASE_IN_OUT)
	slide_tween.set_trans(Tween.TRANS_LINEAR)
	slide_tween.tween_property(self, "position", position + target_offset * side, 0.5)
