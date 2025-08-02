extends Node

var radius = 530/2

var center_left_circle = Vector2(-382,220)
var center_right_circle = Vector2(388, 224)
var spawn_points_left_circle = [Vector2(50,40), Vector2(100,400), Vector2(300,400), Vector2(50,50)]
var rng = RandomNumberGenerator.new()
var keys = ["Q", "W", "E", "R", "F"]
var game_is_paused: bool = false
var volume_float_value: float
var total_point: int
var total_money: int
var enemy0_point: int
var enemy1_point: int
var enemy2_point: int
var enemy3_point: int
var enemy4_point: int


var current_wave = 1

func get_random_key():
	rng.randomize()
	return keys[rng.randi_range(0,keys.size()-1)]
