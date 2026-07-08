extends TextureButton
class_name ImageErrorSlot

var parent_container : Control

signal error_image_pressed(error_image : ImageErrorSlot)

func set_normal_texture(texture : CompressedTexture2D):
	texture_normal = texture


func set_parent_container(container : Control):
	parent_container = container
	

func error_pressed() -> void:
	error_image_pressed.emit(self)
