extends Node2D

@export var alien_move_interval : float
@export var alien_move_distance : int
@export var aliens_parent : Node2D

var elapsed_time : float
var current_move_direction : Vector2 = Vector2.RIGHT
var all_aliens: Array[Node]

func _ready() -> void:
	all_aliens = aliens_parent.get_children()


func _on_timer_timeout() -> void:
	for alien_instance in all_aliens:
		if alien_instance == null or !is_instance_valid(alien_instance):
			continue
		
		if !alien_instance.can_move_in_direction(current_move_direction):
			current_move_direction *= -1
	
	position += current_move_direction * alien_move_distance
