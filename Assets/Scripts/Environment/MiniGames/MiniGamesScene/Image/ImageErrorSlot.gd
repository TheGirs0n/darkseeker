extends TextureButton
class_name ImageErrorSlot


signal error_image_pressed(error_image : ImageErrorSlot)

func set_normal_texture(texture : CompressedTexture2D):
	texture_normal = texture


func error_pressed() -> void:
	error_image_pressed.emit(self)
	
