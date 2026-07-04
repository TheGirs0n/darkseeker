extends TextureButton
class_name WireSlot

@export_group("Textures")
@export var normal_wire_texture : CompressedTexture2D
@export var clicked_wire_texture : CompressedTexture2D
@export var connected_wire_texture : CompressedTexture2D


signal wire_slot_click(wire : WireSlot)


func wire_click() -> void:
	wire_slot_click.emit(self)
