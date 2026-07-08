extends MiniGamesBase
class_name MiniGameImage

@export_group("Mini Game Image Parameters")
@export var first_container : HBoxContainer
@export var second_container : HBoxContainer
@export var image_error_slot : PackedScene

@export_group("Containers Center Node")
@export var first_contaier_center_node_container : HBoxContainer
@export var second_container_center_node_container : HBoxContainer

var first_layer_right_image = null
var second_layer_right_image = null

func _setup(_interactor : CharacterBody3D, mini_game_config : MiniGamesConfig):
	var image_array : MiniGamesImageConfig = mini_game_config
	_setup_layers(mini_game_config)
	_setup_errors(mini_game_config)
	

func _setup_layers(mini_game_config : MiniGamesImageConfig):
	var layers_count = mini_game_config.mini_game_image_count
	
	if layers_count == 1:
		second_container.hide()
	else:
		second_container.show()
		

func _setup_errors(mini_game_config : MiniGamesImageConfig):
	var error_count = mini_game_config.mini_game_image_errors
	
	var images_array = mini_game_config.mini_game_image_array.duplicate().slice(0, error_count - 1)
	images_array.shuffle()
	
	_setup_container(first_container, error_count, images_array)
	
	if error_count == 2:
		images_array.shuffle()
		
		_setup_container(second_container, error_count, images_array)


func _setup_container(container : HBoxContainer, error_count : int, images_array : Array[CompressedTexture2D]):
	for i in range(error_count):
		var error_image = image_error_slot.instantiate() as ImageErrorSlot
		error_image.set_normal_texture(images_array.pick_random())
		error_image.set_parent_container(container)
		
		container.add_child(error_image)
