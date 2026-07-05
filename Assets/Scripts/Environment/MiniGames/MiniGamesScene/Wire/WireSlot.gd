extends TextureButton
class_name WireSlot

@export_group("Textures")
@export var wire_normal_texture : CompressedTexture2D
@export var wire_pressed_texture : CompressedTexture2D
@export var wire_connected_texture : CompressedTexture2D

var wire_slot_color : Color

signal wire_slot_click(wire : WireSlot)

func setup_wire_slot(color : Color):
	self.modulate = color


func wire_click() -> void:
	wire_slot_click.emit(self)


func connect_wire():
	self.disabled = true
