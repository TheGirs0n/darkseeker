extends StaticBody3D
class_name MiniGamesTerminal

@export_group("Terminal Settings")
@export var terminal_mini_game_settings : GlobalEnums.BotDifficulty

var active_mini_game : MiniGamesBase = null
var active_interactor : CharacterBody3D = null
var active_canvas_layer : CanvasLayer = null


func interact(interactor : CharacterBody3D):
	if active_mini_game == null:
		var layer = CanvasLayer.new()
		var mini_game_scene = MiniGamesFabric.get_random_by_scene().instantiate()
		
		active_mini_game = mini_game_scene
		active_mini_game.finished.connect(mini_game_done)
		active_mini_game.start_mini_game(interactor, MiniGamesFabric.get_random_by_difficulty(GlobalEnums.BotDifficulty.EASY))
		
		active_canvas_layer = layer
		layer.add_child(mini_game_scene)
		get_tree().root.add_child(layer)
		
		active_interactor = interactor
		active_interactor.set_controls_disable()
		
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE


func mini_game_done(_done : bool):
	active_mini_game = null
	
	active_canvas_layer.queue_free()
	active_canvas_layer = null
	
	active_interactor.set_controls_enable()
	active_interactor = null
	
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
