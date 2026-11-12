extends Node

@export var max_health : int
@export var sprite : Sprite2D

var current_health : int

func _ready() -> void:
	current_health = max_health
	update_shader_value()


func reduce_health() -> void:
	current_health -= 1
	update_shader_value()
	
	if current_health <= 0:
		queue_free()
	

func update_shader_value() -> void:
	var current_health_float : float = current_health
	sprite.set_instance_shader_parameter("dissolve_amount", 1 - current_health_float/max_health)
	

func _on_area_2d_area_entered(area: Area2D) -> void:
	reduce_health()
