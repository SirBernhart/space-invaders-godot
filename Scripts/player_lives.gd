extends Node2D


var current_lives : int = 3

signal on_lives_changed (current_amount : int)


func decrement_lives() -> void:
	current_lives -= 1
	print("PLAYER DIED! Lives: %s" % current_lives)
	on_lives_changed.emit(current_lives)

func increment_lives() -> void:
	current_lives +=1
