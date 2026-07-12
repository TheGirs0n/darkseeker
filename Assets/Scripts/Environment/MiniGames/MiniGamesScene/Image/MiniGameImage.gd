extends MiniGamesBase
class_name MiniGameImage

@export_group("Mini Game Image Parameters")
@export var first_container : HBoxContainer
@export var image_error_slot : PackedScene

@export_group("Containers Center Node")
@export var first_contaier_center_node_container : HBoxContainer


var first_right_image : ImageErrorSlot = null
var second_right_image : ImageErrorSlot = null

var error_count : int
var right_count : int

func _setup(_interactor : CharacterBody3D, mini_game_config : MiniGamesConfig):
	_setup_errors(mini_game_config)
	

func _setup_errors(mini_game_config : MiniGamesImageConfig):
	error_count = mini_game_config.mini_game_image_errors
	right_count = mini_game_config.mini_game_image_count
	
	var images_array = mini_game_config.mini_game_image_array.duplicate().slice(0, error_count - 1)
	images_array.shuffle()
	
	_setup_container(first_container, error_count, images_array)


func _setup_container(container : HBoxContainer, error_count : int, images_array : Array[CompressedTexture2D]):
	for i in range(error_count):
		var error_image = image_error_slot.instantiate() as ImageErrorSlot
		error_image.set_normal_texture(images_array.pick_random())
		error_image.error_image_pressed.connect(check_error_image)
		
		container.add_child(error_image)
		
	for i in range(error_count):
		var error_image = image_error_slot.instantiate() as ImageErrorSlot
		error_image.set_normal_texture(images_array.pick_random())
		
		container.add_child(error_image)
		

func check_error_image(error_image : ImageErrorSlot):
	if error_image.texture_normal == first_right_image or error_image.texture_normal == second_right_image:
		if error_image.texture_normal == first_right_image:
			error_image.button_pressed = true
		if error_image.texture_normal == second_right_image:
			error_image.button_pressed = true
			
		if first_right_image.button_pressed == true and second_right_image.button_pressed == true:
			_win()
	else:
		apply_time_penalty(1)
