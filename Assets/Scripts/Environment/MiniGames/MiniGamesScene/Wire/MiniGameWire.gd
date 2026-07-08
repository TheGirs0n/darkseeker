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
	var first_color_array = wire_slots_color_array.duplicate()
	var second_color_array = first_color_array.duplicate()
	
	second_color_array.shuffle()
	
	for i in wire_game_config.wire_pairs:
		var wire_slot = wire_slot_scene.instantiate()
		var color_random = first_color_array.pop_front()
		
		wire_slot.setup_wire_slot(color_random)
		wire_slot.wire_slot_click.connect(wire_check)
		first_container.add_child(wire_slot)
		all_wires.append(wire_slot)
	
	for i in wire_game_config.wire_pairs:
		var wire_slot = wire_slot_scene.instantiate()
		var color_random = second_color_array.pop_front()
		
		wire_slot.setup_wire_slot(color_random)
		wire_slot.wire_slot_click.connect(wire_check)
		second_container.add_child(wire_slot)
		all_wires.append(wire_slot)
		

func wire_check(wire_slot : WireSlot):
	if selected_wire_slot == wire_slot:
		return
	
	if selected_wire_slot == null:
		selected_wire_slot = wire_slot
	else:
		if selected_wire_slot.modulate == wire_slot.modulate:
			selected_wire_slot.connect_wire()
			wire_slot.connect_wire()
			
			set_line(selected_wire_slot, wire_slot)
			
			selected_wire_slot = null
			
			_win()
		else:
			selected_wire_slot.button_pressed = false
			wire_slot.button_pressed = false
			selected_wire_slot = null


func _win():
	for wire_slot in all_wires:
		if wire_slot.disabled != true:
			return
			
	super._win()


func set_line(dot_first : WireSlot, dot_second : WireSlot):
	var line = Line2D.new()
	line.width = 6
	line.default_color = dot_first.modulate
	var top_center = dot_first.global_position + dot_first.size / 2
	var bottom_center = dot_second.global_position + dot_second.size / 2
	line.points = [line.to_local(top_center), line.to_local(bottom_center)]
	add_child(line)
