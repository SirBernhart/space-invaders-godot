extends Node

@export var max_health : int

var current_health : int

func _ready() -> void:
	current_health = max_health


func reduce_health() -> void:
	current_health -= 1
	if current_health <= 0:
		queue_free()
	

func _on_area_2d_area_entered(area: Area2D) -> void:
	reduce_health()
