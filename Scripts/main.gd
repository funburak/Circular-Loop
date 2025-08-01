extends Node2D

var enemy_scene = preload("res://Scenes/enemy0.tscn")
var enemy_scene1 = preload("res://Scenes/Enemy/enemy1.tscn")
var enemy_scene2 = preload("res://Scenes/Enemy/enemy2.tscn")
var enemy_scene3 = preload("res://Scenes/Enemy/enemy3.tscn")
var enemy_scene4 = preload("res://Scenes/Enemy/enemy4.tscn")
var player_scene = preload("res://Scenes/player.tscn")
var rng = RandomNumberGenerator.new()
@onready var player_left: Marker2D = $Player_Left
@onready var player_right: Marker2D = $Player_Right
@onready var pause_menu: Control = $PauseMenu
@onready var label: Label = $Total_Points
@onready var enemy_0_points: Label = $Enemy0_Points
@onready var enemy_1_points: Label = $Enemy1_Points
@onready var enemy_2_points: Label = $Enemy2_Points
@onready var enemy_3_points: Label = $Enemy3_Points
@onready var enemy_4_points: Label = $Enemy4_Points


var player : Player

func _ready() -> void:
	Engine.time_scale = 1
	GameManager.game_is_paused = false
	spawn_player()
	spawn_enemy0()
	spawn_enemy1()
	spawn_enemy2()
	spawn_enemy3()
	spawn_enemy4()
			
func _process(delta: float) -> void:
	label.text = str(GameManager.total_point)
	enemy_0_points.text = str(GameManager.enemy0_point)
	enemy_1_points.text = str(GameManager.enemy1_point)
	enemy_2_points.text = str(GameManager.enemy2_point)
	enemy_3_points.text = str(GameManager.enemy3_point)
	enemy_4_points.text = str(GameManager.enemy4_point)

func spawn_enemy1():
	rng.randomize()
	for i in range(0,2):
		var enemy1 = enemy_scene1.instantiate() as Enemy
		if enemy1:
			enemy1.key_label = GameManager.get_random_key()
			enemy1.set_label_text()
			enemy1.global_position = GameManager.spawn_points_left_circle[rng.randi_range(0,3)]
			add_child(enemy1)
func spawn_enemy0():
	rng.randomize()
	for i in range(0,2):
		var enemy = enemy_scene.instantiate() as Enemy
		if enemy:
			enemy.key_label = GameManager.get_random_key()
			enemy.set_label_text()
			enemy.global_position = GameManager.spawn_points_left_circle[rng.randi_range(0,3)]
			add_child(enemy)
func spawn_enemy2():
	rng.randomize()
	for i in range(0,2):
		var enemy1 = enemy_scene2.instantiate() as Enemy
		if enemy1:
			enemy1.key_label = GameManager.get_random_key()
			enemy1.set_label_text()
			enemy1.global_position = GameManager.spawn_points_left_circle[rng.randi_range(0,3)]
			add_child(enemy1)
func spawn_enemy3():
	rng.randomize()
	for i in range(0,2):
		var enemy1 = enemy_scene3.instantiate() as Enemy
		if enemy1:
			enemy1.key_label = GameManager.get_random_key()
			enemy1.set_label_text()
			enemy1.global_position = GameManager.spawn_points_left_circle[rng.randi_range(0,3)]
			add_child(enemy1)
func spawn_enemy4():
	rng.randomize()
	for i in range(0,2):
		var enemy1 = enemy_scene4.instantiate() as Enemy
		if enemy1:
			enemy1.key_label = GameManager.get_random_key()
			enemy1.set_label_text()
			enemy1.global_position = GameManager.spawn_points_left_circle[rng.randi_range(0,3)]
			add_child(enemy1)

func spawn_player():
	player = player_scene.instantiate()
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

func change_player_position(position):
	if player.global_position == player_left.global_position && position == "right":
		player.global_position = player_right.global_position
	elif player.global_position == player_right.global_position && position == "left":
		player.global_position = player_left.global_position
