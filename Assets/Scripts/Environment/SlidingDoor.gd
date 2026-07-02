extends AnimatableBody3D
class_name SlidingDoor

@export_group("Sliding Door Parameters")
@export var target_offset : Vector3 

var is_open : bool = false
var slide_tween : Tween
var start_position : Vector3
var end_position : Vector3

func _ready() -> void:
	start_position = self.global_position
	end_position = start_position + target_offset


func interact():
	is_open = !is_open
	change_door_position(is_open)
	

func change_door_position(is_open : bool):
	if is_open:
		if slide_tween:
			slide_tween.kill()
			
		slide_tween = create_tween()
		slide_tween.set_ease(Tween.EASE_IN_OUT)
		slide_tween.set_trans(Tween.TRANS_LINEAR)
		slide_tween.tween_property(self, "position", start_position, 0.5)
	else:
		if slide_tween:
			slide_tween.kill()
			
		slide_tween = create_tween()
		slide_tween.set_ease(Tween.EASE_IN_OUT)
		slide_tween.set_trans(Tween.TRANS_LINEAR)
		slide_tween.tween_property(self, "position", end_position, 0.5)
