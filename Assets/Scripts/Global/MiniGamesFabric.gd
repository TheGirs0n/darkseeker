extends Node

@export_group("Mini Games Wire Configs")
@export var mini_game_wire_scene : PackedScene
@export var mini_game_wire_congifs : Array[MiniGamesWireConfig]

@export_group("Mini Games Image Configs")
@export var mini_game_image_scene : PackedScene
@export var mini_game_image_congifs : Array[MiniGamesImageConfig]

@export_group("Mini Games Code Configs")
@export var mini_game_code_scene : PackedScene
@export var mini_game_code_congifs : Array[MiniGamesCodeConfig]


func get_random_minigame_scene() -> PackedScene:
	return [mini_game_wire_scene, mini_game_image_scene, mini_game_code_scene].pick_random()
	

func get_random_config_by_difficulty(difficulty : GlobalEnums.BotDifficulty, mini_game : MiniGamesBase) -> MiniGamesConfig:
	if mini_game is MiniGameWire:
		return mini_game_wire_congifs[difficulty]
	if mini_game is MiniGameCode:
		return mini_game_code_congifs[difficulty]
	if mini_game is MiniGameImage:
		return mini_game_image_congifs[difficulty]

	return null
