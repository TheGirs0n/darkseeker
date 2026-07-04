extends StaticBody3D
class_name MiniGamesTerminal

@export var mini_game_panel : PackedScene

var active_panel : MiniGamesPanel = null
var active_interactor : CharacterBody3D = null


func interact(interactor : CharacterBody3D):
	if active_panel == null:
		var layer = CanvasLayer.new()
		var scene = mini_game_panel.instantiate()
		
		active_panel = scene
		active_panel.finished.connect(mini_game_done)
		active_panel.start_mini_game(interactor, MiniGamesFabric.get_random_by_difficulty(GlobalEnums.BotDifficulty.EASY))
		
		layer.add_child(scene)
		get_tree().root.add_child(layer)
		
		active_interactor = interactor
		active_interactor.set_controls_disable()
		
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE


func mini_game_done(_done : bool):
	active_panel = null
	active_interactor.set_controls_enable()
	active_interactor = null
	
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
