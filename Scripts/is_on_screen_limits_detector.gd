extends Node2D
class_name is_on_screen_limits_detector

var is_on_right_limit: bool = false
var is_on_left_limit: bool = false


func _on_left_visible_on_screen_notifier_2d_screen_exited() -> void:
	is_on_left_limit = true


func _on_left_visible_on_screen_notifier_2d_screen_entered() -> void:
	is_on_left_limit = false


func _on_right_visible_on_screen_notifier_2d_screen_exited() -> void:
	is_on_right_limit = true


func _on_right_visible_on_screen_notifier_2d_screen_entered() -> void:
	is_on_right_limit = false
