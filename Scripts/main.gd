extends Node2D

var enemy_scene = preload("res://Scenes/enemy0.tscn")
var player_scene = preload("res://Scenes/player.tscn")
var rng = RandomNumberGenerator.new()
@onready var player_left: Marker2D = $Player_Left
@onready var player_right: Marker2D = $Player_Right
@onready var pause_menu: Control = $PauseMenu

func _ready() -> void:
	GameManager.game_is_paused = false
	spawn_player()
	rng.randomize()
	for i in range(0,10):
		var enemy = enemy_scene.instantiate() as Enemy
		if enemy:
			enemy.key_label = GameManager.get_random_key()
			enemy.set_label_text()
			enemy.global_position = GameManager.spawn_points_left_circle[rng.randi_range(0,3)]
			add_child(enemy)
			
func _process(delta: float) -> void:
	pass

func spawn_player():
	var player = player_scene.instantiate()
	player.global_position = player_left.global_position
	add_child(player)
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ESCAPE"):
		if !GameManager.game_is_paused:
			pause()
		else:
			unpause()

func pause():
	pause_menu.show()
	Engine.time_scale = 0
	GameManager.game_is_paused = true
func unpause():
	pause_menu.hide()
	Engine.time_scale = 1
	GameManager.game_is_paused = false
