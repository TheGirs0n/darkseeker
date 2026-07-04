extends Control
class_name MiniGamesBase


var _active : bool = false
var mini_game_difficulty : GlobalEnums.BotDifficulty = GlobalEnums.BotDifficulty.EASY

signal finished(state : bool)


func start_mini_game(interactor : CharacterBody3D, mini_game_config : MiniGamesConfig):
	_active = true
	_setup(interactor, mini_game_config)
	

func _setup(interactor : CharacterBody3D, mini_game_config : MiniGamesConfig):
	pass
	

func _win():
	_finish(true)


func _lose():
	_finish(false)


func _finish(state : bool):
	if not _active:
		return
		
	_active = false
	finished.emit(state)
