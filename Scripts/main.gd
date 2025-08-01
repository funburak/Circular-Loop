extends Node2D

var enemy_scene = preload("res://Scenes/enemy0.tscn")
var rng = RandomNumberGenerator.new()


func _ready() -> void:
	rng.randomize()
	for i in range(0,10):
		var enemy = enemy_scene.instantiate() as Enemy
		if enemy:
			enemy.global_position = GameManager.spawn_points_left_circle[rng.randi_range(0,3)]
			add_child(enemy)
