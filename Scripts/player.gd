extends Node2D

@export var move_speed: float = 5
@export var bullet_scene: PackedScene
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	move_speed *= 100

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("move_right"):
		position.x += move_speed * delta
	elif Input.is_action_pressed("move_left"):
		position.x -= move_speed * delta 
	if Input.is_action_just_pressed("fire"):
		var new_bullet: Node2D = bullet_scene.instantiate()
		get_parent().add_child(new_bullet)
		new_bullet.position = position
