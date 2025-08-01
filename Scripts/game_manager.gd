extends Node

var radius = 530/2

var center_left_circle = Vector2(-382,220)
var spawn_points_left_circle = [Vector2(50,40), Vector2(100,400), Vector2(300,400), Vector2(50,50)]
var rng = RandomNumberGenerator.new()
var keys = ["Q", "W", "E", "R", "F"]
var game_is_paused: bool = false
var volume_float_value: float

func get_random_key():
	rng.randomize()
	return keys[rng.randi_range(0,keys.size()-1)]
