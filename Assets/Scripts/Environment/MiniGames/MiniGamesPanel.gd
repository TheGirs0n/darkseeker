extends CanvasLayer
class_name MiniGamesPanel


signal finished(state : bool)


func win_button() -> void:
	finished.emit(true)
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	queue_free()


func lose_button() -> void:
	finished.emit(false)
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	queue_free()
