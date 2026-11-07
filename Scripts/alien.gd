extends Node2D

@export var screen_limits_detector: is_on_screen_limits_detector

func can_move_in_direction(move_direction: Vector2):
	return !screen_limits_detector.is_on_right_limit if move_direction.x > 0 else !screen_limits_detector.is_on_left_limit

func _on_area_2d_area_entered(area: Area2D) -> void:
	queue_free()
