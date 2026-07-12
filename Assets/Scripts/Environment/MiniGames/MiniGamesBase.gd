extends Control
class_name MiniGamesBase


var _active : bool = false
var mini_game_difficulty : GlobalEnums.BotDifficulty = GlobalEnums.BotDifficulty.EASY
var mini_game_timer_waittime : float
var mini_game_timer_active : bool = false

signal finished(state : bool)


func start_mini_game(interactor : CharacterBody3D, mini_game_config : MiniGamesConfig):
	_active = true
	_setup(interactor, mini_game_config)
	
	if mini_game_config.mini_game_fail_time > 0:
		mini_game_timer_waittime = mini_game_config.mini_game_fail_time
		mini_game_timer_active = true
		
	

func _setup(_interactor : CharacterBody3D, _mini_game_config : MiniGamesConfig):
	pass
	

func _process(delta: float) -> void:
	if not _active or not mini_game_timer_active:
		return
		
	mini_game_timer_waittime -= delta
	
	if mini_game_timer_waittime <= 0:
		_lose()


func apply_time_penalty(seconds : float):
	mini_game_timer_waittime -= seconds


func _win():
	_finish(true)


func _lose():
	_finish(false)


func _finish(state : bool):
	if not _active:
		return
		
	_active = false
	finished.emit(state)
