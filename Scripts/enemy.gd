class_name Enemy

extends AnimatedSprite2D

var radius = GameManager.radius
var angle: float = 0.0
var speed: float = 2.0
var key_label: StringName
var damage: int
var current_center_point: Vector2 = GameManager.center_left_circle
var health = 2

func _ready() -> void:
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	angle = rng.randf_range(0.0, TAU)

func _physics_process(delta: float) -> void:
	angle += speed * delta
	var x_pos = cos(angle)
	var y_pos = sin(angle)

	position.x = radius * x_pos + current_center_point.x
	position.y = radius * y_pos + current_center_point.y
	
	if(health <= 0):
		queue_free()
	

func set_label_text():
	for node : Node in get_children():
		if node is Label:
			node.text = key_label
			

func take_damage():
	health -= 1
	change_circle()

func change_circle():
	if current_center_point == GameManager.center_left_circle:
		current_center_point = GameManager.center_right_circle
	else:
		current_center_point = GameManager.center_left_circle
