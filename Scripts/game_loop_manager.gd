extends Node

@export var aliens:Node2D


func _ready() -> void:
	PlayerLives.on_lives_changed.connect(_on_player_lives_changed)
	aliens.all_aliens_died.connect(_on_all_aliens_dead)

func _on_player_lives_changed(current_lives: int) -> void:
	if current_lives <= 0:
		print("GAME OVER! Resetting...")
		PlayerLives.setup_lives()
		Score.reset_score()
		
	_reload_level()
	
func _on_all_aliens_dead() -> void:
	print("VICTORY! Going to next level...")
	PlayerLives.increment_lives()
	_reload_level()

func _reload_level() -> void:
	get_tree().change_scene_to_file("Scenes/play_ground.tscn")
	
func _exit_tree() -> void:
	PlayerLives.on_lives_changed.disconnect(_on_player_lives_changed)
