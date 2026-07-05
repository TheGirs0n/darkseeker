extends MiniGamesBase
class_name MiniGameWire

@export_group("Mini Game Wire Parameters")
@export var wire_slots_color_array : Array[Color]
@export var wire_slot_scene : PackedScene
@export var first_container : HBoxContainer
@export var second_container : HBoxContainer

var selected_wire_slot : WireSlot
var all_wires : Array[WireSlot]

func _setup(interactor : CharacterBody3D, mini_game_config : MiniGamesConfig):
	var wire_game_config : MiniGamesWireConfig = mini_game_config
	
	wire_slots_color_array.shuffle()
	
	for i in wire_game_config.wire_pairs:
		var wire_slot = wire_slot_scene.instantiate()
		var color_random = wire_slots_color_array.pick_random()
		
		wire_slot.setup_wire_slot(color_random)
		wire_slot.wire_slot_click.connect(wire_check)
		first_container.add_child(wire_slot)
		all_wires.append(wire_slot)
		
	wire_slots_color_array.shuffle()
	
	for i in wire_game_config.wire_pairs:
		var wire_slot = wire_slot_scene.instantiate()
		var color_random = wire_slots_color_array.pick_random()
		
		wire_slot.setup_wire_slot(color_random)
		wire_slot.wire_slot_click.connect(wire_check)
		second_container.add_child(wire_slot)
		all_wires.append(wire_slot)
		

func wire_check(wire_slot : WireSlot):
	if selected_wire_slot == null:
		selected_wire_slot = wire_slot
	else:
		if selected_wire_slot.modulate == wire_slot.modulate:
			selected_wire_slot.connect_wire()
			wire_slot.connect_wire()
		else:
			selected_wire_slot.button_pressed = false
			wire_slot.button_pressed = false
			selected_wire_slot = null


func _win():
	for wire_slot in all_wires:
		if wire_slot.disabled != true:
			return
			
	super._win()
