extends CanvasLayer
class_name MiniGamesPanel


signal finished(state : bool)


func win_button() -> void:
	finished.emit(true)
	queue_free()


func lose_button() -> void:
	finished.emit(false)
	queue_free()
