extends Node

var _respawn_point : Transform3D
var _has_point : bool = false

func set_checkpoint(point : Transform3D):
	_respawn_point = point
	_has_point = true
	
	
func respawn(player : PlayerOverral):
	if not _has_point:
		return
		
	player.respawn_at(_respawn_point)
	get_tree().call_group("enemy", "forget_player")
