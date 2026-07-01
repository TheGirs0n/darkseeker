extends Node
class_name PlayerMoveComponent

@export_group("Normal State")
@export var walk_speed : float = 5
@export var walk_height : float
@export var walk_eyes_y_pos : float

@export_group("Crouch State")
@export var crouch_speed : float = 3
@export var crouch_height : float = 3
@export var crouch_eyes_y_pos : float

@export_group("Shapes")
@export var head : Node3D
@export var collision_shape : CollisionShape3D


const GRAVITY_FORCE : float = 9.8
var input_direction : Vector2 = Vector2.ZERO

var move_speed : float = 0
var body_to_move : CharacterBody3D = null

var is_crouch : bool

func _ready() -> void:
	body_to_move = get_parent()
	move_speed = walk_speed
	

func _input(event: InputEvent) -> void:
	if event is InputEventAction:
		if Input.is_action_pressed("crouch"):
			is_crouch = !is_crouch
			move_speed = crouch_speed if is_crouch else walk_speed
			

func _physics_process(delta: float) -> void:
	apply_gravity(delta)
	normal_move()
	crouch_move()
	
	body_to_move.move_and_slide()
	
	
func normal_move():
	input_direction = Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	var updated_direction = body_to_move.transform.basis * Vector3(input_direction.x, 0, input_direction.y)
	
	if input_direction:
		body_to_move.velocity.x = updated_direction.x * move_speed
		body_to_move.velocity.z = updated_direction.z * move_speed
	else:
		body_to_move.velocity.x = 0
		body_to_move.velocity.z = 0
	
	
func crouch_move():
	if is_crouch:
		collision_shape.shape.height = crouch_height
		head.position.y = crouch_eyes_y_pos
	else:
		collision_shape.shape.height = walk_height
		head.position.y = walk_eyes_y_pos
		
	
func apply_gravity(delta : float):
	if not body_to_move.is_on_floor():
		body_to_move.velocity.y -= GRAVITY_FORCE * delta
