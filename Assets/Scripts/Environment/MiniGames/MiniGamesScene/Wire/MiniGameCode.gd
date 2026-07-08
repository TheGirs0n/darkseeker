extends MiniGamesBase
class_name MiniGameCode

@export_group("Code Labels")
@export var first_slot : Label
@export var second_slot : Label
@export var third_slot : Label

var code_alphabet : String
var code_letters : String
var code_current_index : int = 0

func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.is_pressed():
		var symbol = char(event.unicode)
		if symbol in code_alphabet:
			if code_letters[code_current_index] == symbol:
				code_current_index += 1
				_win()
			else:
				code_current_index = 0
				
				
func _setup(interactor : CharacterBody3D, mini_game_config : MiniGamesConfig):
	var code_config : MiniGamesCodeConfig = mini_game_config 
	set_numbers(code_config)


func set_numbers(code_config : MiniGamesCodeConfig):
	code_alphabet = code_config.mini_game_code_alphabet
	
	#code_letters = code_config.mini_game_code_alphabet.


func _win():
	if code_current_index != 2:
		return
	else:
		super._win()
