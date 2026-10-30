extends Node2D

func _process(delta: float) -> void:
	position.y -= 5 * delta * 100
	
	if position.y <= 0 :
		queue_free()

func _on_area_2d_area_entered(area: Area2D) -> void:
	queue_free()
