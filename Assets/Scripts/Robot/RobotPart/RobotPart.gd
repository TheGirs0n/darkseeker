extends StaticBody3D
class_name RobotPart


func interact(_interactor : CharacterBody3D):
	GameState.add_robot_part()
	queue_free()
