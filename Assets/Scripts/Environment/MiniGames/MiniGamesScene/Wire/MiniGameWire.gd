extends MiniGamesBase
class_name MiniGameWire

@export_group("Mini Game Wire Parameters")
@export var wire_slot_scene : PackedScene
@export var first_container : HBoxContainer
@export var second_container : HBoxContainer


func _setup(interactor : CharacterBody3D, mini_game_config : MiniGamesConfig):
	var wire_game_config : MiniGamesWireConfig = mini_game_config
	for i in wire_game_config.wire_pairs:
		var wire_slot = wire_slot_scene.instantiate()
		
		wire_slot.wire_slot_click.connect(wire_check)
		first_container.add_child(wire_slot)
	for i in wire_game_config.wire_pairs:
		var wire_slot = wire_slot_scene.instantiate()
		
		wire_slot.wire_slot_click.connect(wire_check)
		second_container.add_child(wire_slot)


func wire_check(wire_slot : WireSlot):
	pass


func _win():
	pass
	
	
func _lose():
	pass
