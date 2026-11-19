extends Node2D

@export var y_direction : int
@export var speed : float

func _process(delta: float) -> void:
	position.y += y_direction * speed * delta * 100
	
	if position.y <= 0 :
		queue_free()

func _on_area_2d_area_entered(area: Area2D) -> void:
	queue_free()
