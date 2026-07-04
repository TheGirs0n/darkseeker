extends MiniGamesBase
class_name MiniGamesPanel


func win_button() -> void:
	finished.emit(true)
	queue_free()


func lose_button() -> void:
	finished.emit(false)
	queue_free()
