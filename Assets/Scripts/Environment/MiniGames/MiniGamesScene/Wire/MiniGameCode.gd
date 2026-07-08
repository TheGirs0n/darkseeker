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
	if event is InputEventKey and event.is_pressed() and not event.echo:
		var symbol = char(event.unicode).to_upper()
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
	
	var first_letter = code_alphabet[randi_range(0, code_alphabet.length() - 1)]
	var second_letter = code_alphabet[randi_range(0, code_alphabet.length() - 1)]
	var third_letter = code_alphabet[randi_range(0, code_alphabet.length() - 1)]
	
	code_letters = first_letter + second_letter + third_letter

	first_slot.text = first_letter
	second_slot.text = second_letter
	third_slot.text = third_letter


func _win():
	if code_current_index != code_letters.length():
		return
	else:
		super._win()
