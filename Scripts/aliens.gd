extends Node2D

@export var starting_alien_move_interval : float
@export var alien_move_interval_decrement : float
@export var min_alien_move_interval : float
@export var alien_move_distance : int
@export var alien_vertical_move_distance : int
@export var aliens_parent : Node2D
@export var move_timer : Timer
@export var score : Score

var current_move_direction : Vector2 = Vector2.RIGHT
var all_aliens: Array[Node]


func _ready() -> void:
	all_aliens = aliens_parent.get_children()
	move_timer.start(starting_alien_move_interval)
	for alien in all_aliens:
		alien.on_death.connect(score.increase_score)

func _on_aliens_move_timer_timeout() -> void:
	for alien_instance in all_aliens:
		if alien_instance == null or !is_instance_valid(alien_instance):
			continue
		
		if !alien_instance.can_move_in_direction(current_move_direction):
			current_move_direction *= -1
			
			move_timer.start(max(move_timer.wait_time - alien_move_interval_decrement, min_alien_move_interval))
			position.y += alien_vertical_move_distance
			return
	
	position += current_move_direction * alien_move_distance
