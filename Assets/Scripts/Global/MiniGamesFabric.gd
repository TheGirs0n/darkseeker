extends Node

@export_group("Mini Games Wire Configs")
@export var mini_game_easy_wire_config : MiniGamesWire
@export var mini_game_medium_wire_config : MiniGamesWire
@export var mini_game_hard_wire_config : MiniGamesWire

@export_group("Mini Games Image Configs")
@export var mini_game_easy_image_config : MiniGamesWire
@export var mini_game_medium_image_config : MiniGamesWire
@export var mini_game_hard_image_config : MiniGamesWire

@export_group("Mini Games Code Configs")
@export var mini_game_easy_code_config : MiniGamesWire
@export var mini_game_medium_code_config : MiniGamesWire
@export var mini_game_hard_code_config : MiniGamesWire


func get_random_by_difficulty(difficulty : GlobalEnums.BotDifficulty) -> MiniGamesConfig:
	match difficulty:
		GlobalEnums.BotDifficulty.EASY:
			return get_random_easy()
		GlobalEnums.BotDifficulty.MEDIUM:
			return get_random_medium()
		GlobalEnums.BotDifficulty.HARD:
			return get_random_hard()
	return null
	

func get_random_easy() -> MiniGamesConfig:
	return [mini_game_easy_wire_config, mini_game_easy_image_config, mini_game_easy_code_config].pick_random()


func get_random_medium() -> MiniGamesConfig:
	return [mini_game_medium_wire_config, mini_game_medium_image_config, mini_game_medium_code_config].pick_random()

	
func get_random_hard() -> MiniGamesConfig:
	return [mini_game_hard_wire_config, mini_game_hard_image_config, mini_game_hard_code_config].pick_random()
