extends Node2D

var max_lives: int = 3
var current_lives : int

signal on_lives_changed (current_amount : int)


func _ready() -> void:
	setup_lives()

func setup_lives() -> void:
	current_lives = max_lives

func decrement_lives() -> void:
	current_lives -= 1
	print("PLAYER DIED! Lives: %s" % current_lives)
	on_lives_changed.emit(current_lives)

func increment_lives() -> void:
	current_lives +=1
	print("Player gained 1 life! Current: %s" % current_lives)
