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
	change_door_position(is_open)
	is_open = !is_open
	

func change_door_position(is_open : bool):
	var target = start_position if is_open == true else end_position

	if slide_tween:
		slide_tween.kill()
		
	slide_tween = create_tween()
	slide_tween.set_ease(Tween.EASE_IN_OUT)
	slide_tween.set_trans(Tween.TRANS_CUBIC)
	slide_tween.tween_property(self, "global_position", target, 0.5)
