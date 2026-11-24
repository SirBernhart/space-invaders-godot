extends Node2D

@export var min_bonus_alien_interval : float
@export var max_bonus_alien_interval : float
@export var bonus_alien_scene : PackedScene
@export var instantiation_timer : Timer


func _ready() -> void:
	set_new_instantiation_interval()
	
func set_new_instantiation_interval() -> void:
	var interval = randf_range(min_bonus_alien_interval, max_bonus_alien_interval)
	instantiation_timer.start(interval)


func _on_bonus_alien_instantiaion_timer_timeout() -> void:
	var instance : Node2D = bonus_alien_scene.instantiate()
	add_child(instance)
	instance.global_position = Vector2(0, global_position.y)
	var x_move_direction = -1 if randi_range(0,1) == 0 else 1
	instance.setup(x_move_direction)

	set_new_instantiation_interval()
