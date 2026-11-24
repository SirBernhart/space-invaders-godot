extends Node2D


var current_score : int = 0


func reset_score() -> void:
	current_score = 0

func increase_score(amount : int) -> void:
	current_score += amount
	print("Score: %s" % current_score)
