extends Control
class_name MiniGamesBase

signal finished(state : bool)

var _active : bool = false


func start_mini_game(context : MiniGamesContext):
	_active = true


func _setup(context : MiniGamesConfig):
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
