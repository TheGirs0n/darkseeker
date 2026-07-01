extends Node3D
class_name PlayerCameraFreeLook

@export var camera : Camera3D
@export var camera_sensivity : float = 0.25


func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
	
func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		_rotate(-event.relative.x, -event.relative.y)


func _rotate(x_position : float, y_position : float):
	rotate_y(deg_to_rad(x_position) * camera_sensivity)
	camera.rotate_x(deg_to_rad(y_position) * camera_sensivity)
	camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-90), deg_to_rad(90))
