extends StaticBody3D
class_name MiniGamesTerminal


@export var mini_game_panel : PackedScene

var active_panel : MiniGamesPanel = null

func interact():
	if active_panel == null:
		var scene = mini_game_panel.instantiate()
		active_panel = scene
		get_tree().root.add_child(scene)
		
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
