extends MiniGamesBase
class_name MiniGameCode

@export_group("Code Labels")
@export var first_slot : Label
@export var second_slot : Label
@export var third_slot : Label


func _input(event: InputEvent) -> void:
	pass


func _setup(interactor : CharacterBody3D, mini_game_config : MiniGamesConfig):
	var code_config : MiniGamesCodeConfig = mini_game_config 
	set_numbers(code_config)


func set_numbers(code_config : MiniGamesCodeConfig):
	first_slot.text = code_config.mini_game_code_alphabet[randi_range(0, code_config.mini_game_code_alphabet.length())]
	second_slot.text = code_config.mini_game_code_alphabet[randi_range(0, code_config.mini_game_code_alphabet.length())]
	third_slot.text = code_config.mini_game_code_alphabet[randi_range(0, code_config.mini_game_code_alphabet.length())]
	

func _win():
	_finish(true)


func _lose():
	_finish(false)
