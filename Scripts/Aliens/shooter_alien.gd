extends Alien


@export var bullet_scenes : Array[PackedScene]
@export var shot_timer : Timer
@export var chance_to_shoot : int = 30


func _ready() -> void:
	shot_timer.timeout.connect(attempt_shooting)
	
func attempt_shooting() -> void:
	if chance_to_shoot >= randi_range(0, 100):
		var picked_bullet_index = randi_range(0,1)
		var new_bullet: Node2D = bullet_scenes[picked_bullet_index].instantiate()
		owner.add_child(new_bullet)
		new_bullet.global_position = global_position
