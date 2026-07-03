extends StaticBody3D
class_name MiniGamesTerminal

@export var mini_game_panel : PackedScene

var active_panel : MiniGamesPanel = null

func interact(interactor : CharacterBody3D):
	if active_panel == null:
		var scene = mini_game_panel.instantiate()
		active_panel = scene
		active_panel.finished.connect(mini_game_done)
		get_tree().root.add_child(scene)
		
		interactor.set_controls_disable()
		
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE


func mini_game_done(_done : bool):
	active_panel = null
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
