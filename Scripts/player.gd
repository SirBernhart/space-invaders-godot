extends Node2D

@export var move_speed: float = 5
@export var bullet_scene: PackedScene
@export var screen_limit_detector: is_on_screen_limits_detector

var can_fire: bool = true

func _ready() -> void:
	move_speed *= 100


func _process(delta: float) -> void:
	if Input.is_action_pressed("move_right"):
		if !screen_limit_detector.is_on_right_limit:
			position.x += move_speed * delta
	elif Input.is_action_pressed("move_left"):
		if !screen_limit_detector.is_on_left_limit:
			position.x -= move_speed * delta 
	if Input.is_action_just_pressed("fire") and can_fire:
		var new_bullet: Node2D = bullet_scene.instantiate()
		get_parent().add_child(new_bullet)
		new_bullet.position = position
		new_bullet.tree_exited.connect(toggle_can_fire)
		toggle_can_fire()
		
func toggle_can_fire():
	can_fire = !can_fire
