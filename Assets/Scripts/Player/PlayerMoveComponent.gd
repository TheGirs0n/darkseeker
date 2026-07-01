extends Node
class_name PlayerMoveComponent

@export var move_speed : float = 5

const GRAVITY_FORCE : float = 9.8
var input_direction : Vector2 = Vector2.ZERO

var body_to_move : CharacterBody3D = null

func _ready() -> void:
	body_to_move = get_parent()
	

func _physics_process(delta: float) -> void:
	apply_gravity(delta)
	move()
	
	body_to_move.move_and_slide()
	
	
func move():
	input_direction = Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	var updated_direction = body_to_move.transform.basis * Vector3(input_direction.x, 0, input_direction.y)
	
	if input_direction:
		body_to_move.velocity.x = updated_direction.x * move_speed
		body_to_move.velocity.z = updated_direction.z * move_speed
	else:
		body_to_move.velocity.x = 0
		body_to_move.velocity.z = 0
	
	
func apply_gravity(delta : float):
	if not body_to_move.is_on_floor():
		body_to_move.velocity.y -= GRAVITY_FORCE * delta
