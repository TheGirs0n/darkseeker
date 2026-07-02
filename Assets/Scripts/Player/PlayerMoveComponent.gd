extends Node
class_name PlayerMoveComponent

@export_group("Normal State")
@export var walk_speed : float = 5
@export var walk_height : float = 2
@export var walk_eyes_y_pos : float = 1
@export var walk_shape_y_pos : float = 0

@export_group("Crouch State")
@export var crouch_speed : float = 3
@export var crouch_height : float = 1
@export var crouch_eyes_y_pos : float = 0.5
@export var crouch_shape_y_pos : float = -0.5

@export_group("Shapes")
@export var head : Node3D
@export var collision_shape : CollisionShape3D

@export_group("Crouch RayCast")
@export var crouch_raycast : RayCast3D


const GRAVITY_FORCE : float = 9.8
var input_direction : Vector2 = Vector2.ZERO

var move_speed : float = 0
var body_to_move : CharacterBody3D = null

var is_crouch : bool

func _ready() -> void:
	body_to_move = get_parent()
	move_speed = walk_speed
	

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("crouch"):
		if is_crouch:
			crouch_raycast.force_raycast_update()
			if crouch_raycast.is_colliding():
				print("ray collide with + " + str(crouch_raycast.get_collider()))
				is_crouch = true
			else:
				is_crouch = false
		else:
			is_crouch = true
		
		print(is_crouch)
		crouch_move()


func _physics_process(delta: float) -> void:
	apply_gravity(delta)
	get_movement()
	
	body_to_move.move_and_slide()
	
	
func get_movement():
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
		move_speed = crouch_speed
		collision_shape.shape.height = crouch_height
		collision_shape.position.y = crouch_shape_y_pos
		head.position.y = crouch_eyes_y_pos
	else:
		move_speed = walk_speed
		collision_shape.shape.height = walk_height
		collision_shape.position.y = walk_shape_y_pos
		head.position.y = walk_eyes_y_pos
		
	
func apply_gravity(delta : float):
	if not body_to_move.is_on_floor():
		body_to_move.velocity.y -= GRAVITY_FORCE * delta
