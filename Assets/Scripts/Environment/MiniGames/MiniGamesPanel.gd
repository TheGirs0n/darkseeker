extends MiniGamesBase
class_name MiniGamesPanel


func win_button() -> void:
	_win()
	queue_free()


func lose_button() -> void:
	_lose()
	queue_free()
