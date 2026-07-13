extends StaticBody3D
class_name LoreEntry


@export var lore_entry_res : LoreEntryResource
var active_interactor : CharacterBody3D
var lore_entry_panel : PackedScene = preload("res://Assets/Scenes/Environment/LoreEntry/LoreEntryText.tscn")

var is_active : bool = false


func interact(interactor : CharacterBody3D):
	if is_active == false:
		is_active = true
		
		var lore_entry_panel_scene = lore_entry_panel.instantiate() as LoreEntryText
		lore_entry_panel_scene.set_text(lore_entry_res.lore_entry_text)
		lore_entry_panel_scene.set_title(lore_entry_res.lore_entry_title)
		lore_entry_panel_scene.lore_closed.connect(close_note)
		
		get_tree().root.add_child(lore_entry_panel_scene)

		active_interactor = interactor
		active_interactor.set_controls_disable()
		
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE


func close_note():
	is_active = false
	
	active_interactor.set_controls_enable()
	active_interactor = null
		
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
