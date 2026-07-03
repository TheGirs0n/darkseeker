extends ComponentTemplate
class_name PlayerCameraFreeLook


@export_group("Player")
@export var body_to_look : CharacterBody3D = null

@export_group("Camera Parameters")
@export var camera : Camera3D
@export var camera_sensitivity : float = 0.003



func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
	
func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		_rotate(-event.relative.x, -event.relative.y)
	elif event.is_action_pressed("pause"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
			

func _rotate(x_position : float, y_position : float):
	body_to_look.rotate_y(x_position * camera_sensitivity)
	camera.rotate_x(y_position * camera_sensitivity)
	camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-90), deg_to_rad(90))
