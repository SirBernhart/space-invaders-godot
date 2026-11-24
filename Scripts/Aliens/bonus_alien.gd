extends Alien

@export var speed: float
var x_move_direction : int
var has_instantiation_grace_state : bool

func setup(new_x_move_direction: int) -> void:
	x_move_direction = new_x_move_direction
	speed *= 100

func _process(delta: float) -> void:
	position.x += speed * delta * x_move_direction


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	if has_instantiation_grace_state:
		has_instantiation_grace_state = false
		return
	
	queue_free()
