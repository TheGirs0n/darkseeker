extends Control
class_name MiniGamesBase

signal finished(state : bool)

var _active : bool = false


func start_mini_game(interactor : CharacterBody3D, mini_game_config : MiniGamesConfig):
	_active = true


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
