extends Node
class_name StateMachine

@export_group("States Array")
@export var states_array : Array[EnemyStateTemplate]
@export var initial_state : EnemyStateTemplate

var current_state : EnemyStateTemplate

func _ready() -> void:
	current_state = initial_state
	current_state.enter_state()
	

func _physics_process(delta: float) -> void:
	current_state.update_state(delta)
	

func change_state(new_state : EnemyStateTemplate):
	current_state.exit_state()
	current_state = new_state
	current_state.enter_state()
