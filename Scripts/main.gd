extends Node2D

var enemy_scene = preload("res://Scenes/enemy0.tscn")
var enemy_scene1 = preload("res://Scenes/Enemy/enemy1.tscn")
var enemy_scene2 = preload("res://Scenes/Enemy/enemy2.tscn")
var enemy_scene3 = preload("res://Scenes/Enemy/enemy3.tscn")
var enemy_scene4 = preload("res://Scenes/Enemy/enemy4.tscn")
var enemy_scenes = [enemy_scene, enemy_scene1, enemy_scene2, enemy_scene3, enemy_scene4]

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
var wave_spawned = false

func _ready() -> void:
	GameManager.health = 100
	Engine.time_scale = 1
	GameManager.game_is_paused = false
	GameManager.current_wave = 1
	reset_labels()
	spawn_player()
	
func _process(delta: float) -> void:
	if not wave_spawned:
		match GameManager.current_wave:
			1: 
				wave_1()
				wave_spawned = true
			2:
				wave_2()
				wave_spawned = true
	
	label.text = str(GameManager.total_point)
	enemy_0_points.text = str(GameManager.enemy0_point)
	enemy_1_points.text = str(GameManager.enemy1_point)
	enemy_2_points.text = str(GameManager.enemy2_point)
	enemy_3_points.text = str(GameManager.enemy3_point)
	enemy_4_points.text = str(GameManager.enemy4_point)
	
	check_enemies_dead()

func spawn_enemies(count: int, enemy_scene_type: PackedScene):
	rng.randomize()
	for i in range(0,count):
		var enemy = enemy_scene_type.instantiate() as Enemy
		if enemy:
			enemy.key_label = GameManager.get_random_key()
			enemy.set_label_text()
			enemy.global_position = GameManager.spawn_points_left_circle[rng.randi_range(0,3)]
			enemy.add_to_group("enemies")
			add_child(enemy)

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
func reset_labels():
	GameManager.enemy0_point = 0
	GameManager.enemy1_point = 0
	GameManager.enemy2_point = 0
	GameManager.enemy3_point = 0
	GameManager.enemy4_point = 0
	GameManager.total_money = 0
	GameManager.total_point = 0
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

func check_enemies_dead():
	if get_tree().get_nodes_in_group("enemies").is_empty():
		GameManager.current_wave += 1
		if GameManager.current_wave == GameManager.max_wave:
			get_tree().change_scene_to_file("res://Scenes/Menu/game_over_menu.tscn")
		else:
			wave_spawned = false
			print("Shop phase")
		
func spawn_random_enemies(count:int):
	rng.randomize()
	var index = rng.randi_range(0,enemy_scenes.size()-1)
	var scene = enemy_scenes[index]
	spawn_enemies(count,scene)

func wave_1():
	var enemy_count = 3
	spawn_random_enemies(enemy_count)
	await get_tree().create_timer(1).timeout
	spawn_random_enemies(enemy_count)
	
func wave_2():
	var enemy_count = 5
	
	spawn_random_enemies(enemy_count)
	await get_tree().create_timer(1).timeout
	spawn_random_enemies(enemy_count)
	await get_tree().create_timer(1).timeout
	spawn_random_enemies(enemy_count)
		
func take_damage(damage: int):
	if (GameManager.health > 0):
		GameManager.health -= damage

func _on_left_area_area_entered(area: Area2D) -> void:
	var enemy = area.get_parent() as Enemy
	if enemy:
		#GameManager.enemy_group.erase(enemy)
		take_damage(enemy.damage)

func _on_right_area_area_entered(area: Area2D) -> void:
	var enemy = area.get_parent() as Enemy
	if enemy:
		#GameManager.enemy_group.erase(enemy)
		take_damage(enemy.damage)
