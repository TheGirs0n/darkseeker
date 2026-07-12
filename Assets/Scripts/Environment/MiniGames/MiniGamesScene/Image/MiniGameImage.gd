extends MiniGamesBase
class_name MiniGameImage

@export_group("Mini Game Image Parameters")
@export var first_container : HBoxContainer
@export var image_error_slot : PackedScene

@export_group("Containers Center Node")
@export var first_contaier_center_node_container : HBoxContainer

var references : Array[CompressedTexture2D]

var error_count : int
var right_count : int

var found_count : int = 0

func _setup(_interactor : CharacterBody3D, mini_game_config : MiniGamesConfig):
	error_count = mini_game_config.mini_game_image_errors
	right_count = mini_game_config.mini_game_image_count
	
	_setup_errors(mini_game_config)
	
	
func _setup_errors(mini_game_config : MiniGamesImageConfig):
	var image_array = mini_game_config.mini_game_image_array

	var images_error = image_array.duplicate()
	images_error.shuffle()
	
	var images_error_slice = images_error.slice(0, error_count)
	
	for error in range(right_count):
		references.append(images_error_slice[error])
		var texture = TextureRect.new()
		texture.texture = images_error_slice[error]
		texture.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
		
		first_contaier_center_node_container.add_child(texture)
	
	images_error_slice.shuffle()
	
	for error in range(error_count):
		var error_slot = image_error_slot.instantiate()
		error_slot.set_normal_texture(images_error_slice[error])
		error_slot.error_image_pressed.connect(check_error_image)
		
		first_container.add_child(error_slot)
		

func check_error_image(error_slot : ImageErrorSlot):
	if error_slot.texture_normal in references and found_count != right_count:
		error_slot.disabled = true
		found_count += 1
		
		if found_count == right_count:
			_win()
	else:
		apply_time_penalty(1)
