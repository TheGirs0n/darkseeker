extends ComponentTemplate
class_name PlayerMoveComponent

@export_group("Normal State")
@export var walk_speed : float = 5
@export var walk_height : float = 2
@export var walk_eyes_y_pos : float = 1
@export var walk_shape_y_pos : float = 0
@export var walk_noise_radius : float = 6.5

@export_group("Crouch State")
@export var crouch_speed : float = 3
@export var crouch_height : float = 1
@export var crouch_eyes_y_pos : float = 0.5
@export var crouch_shape_y_pos : float = -0.5
@export var crouch_noise_radius : float = 4

@export_group("Shapes")
@export var head : Node3D
@export var height_collision_shape : CollisionShape3D

@export_group("Noise Parameters")
@export var noise_area : Area3D
@export var noise_collision_shape : CollisionShape3D
@export var noise_timer : Timer
@export var noise_waittime : float = 0.5

@export_group("Crouch RayCast")
@export var crouch_raycast : RayCast3D

@export_group("Player Parameters")
@export var body_to_move : CharacterBody3D = null

const GRAVITY_FORCE : float = 9.8
var input_direction : Vector2 = Vector2.ZERO

var move_speed : float = 0

var is_crouch : bool

func _ready() -> void:
	move_speed = walk_speed
	noise_timer.wait_time = noise_waittime
	noise_collision_shape.shape.radius = walk_noise_radius
	

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("crouch"):
		if is_crouch:
			crouch_raycast.force_raycast_update()
			if crouch_raycast.is_colliding():
				is_crouch = true
			else:
				is_crouch = false
		else:
			is_crouch = true

		set_crouch_move()


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
		
		if noise_timer.is_stopped():
			noise_timer.start()
			
			for i in noise_area.get_overlapping_bodies():
				i.enemy_detect_component.check_hear()
	else:
		body_to_move.velocity.x = 0
		body_to_move.velocity.z = 0
	
	
func set_crouch_move():
	if is_crouch:
		move_speed = crouch_speed
		height_collision_shape.shape.height = crouch_height
		height_collision_shape.position.y = crouch_shape_y_pos
		head.position.y = crouch_eyes_y_pos
		noise_collision_shape.shape.radius = crouch_noise_radius
	else:
		move_speed = walk_speed
		height_collision_shape.shape.height = walk_height
		height_collision_shape.position.y = walk_shape_y_pos
		head.position.y = walk_eyes_y_pos
		noise_collision_shape.shape.radius = walk_noise_radius
		
	
func apply_gravity(delta : float):
	if not body_to_move.is_on_floor():
		body_to_move.velocity.y -= GRAVITY_FORCE * delta
