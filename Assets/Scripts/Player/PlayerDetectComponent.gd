extends ComponentTemplate
class_name PlayerDetectComponent

@export_group("Player Detect Markers")
@export var markers : Array[Marker3D]


func is_player_detected(enemy_eyes : Marker3D, world_state : PhysicsDirectSpaceState3D) -> bool:
	for marker in markers:
		var physics_ray : PhysicsRayQueryParameters3D = PhysicsRayQueryParameters3D.create(enemy_eyes.global_position, marker.global_position)
		var intersect : Dictionary = world_state.intersect_ray(physics_ray)
		if intersect.is_empty():
			return true
		else:
			continue
			
	return false
