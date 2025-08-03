class_name Enemy

extends AnimatedSprite2D

var radius = GameManager.radius
var angle: float = 0.0
var speed: float = 2.0
var key_label: StringName
var damage: int
var current_center_point: Vector2 = GameManager.center_left_circle
var health = 2
var point: int
var money_drop: int

func _ready() -> void:
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	angle = rng.randf_range(0, TAU/2)

func _physics_process(delta: float) -> void:
	angle += speed * delta
	var x_pos = cos(angle)
	var y_pos = sin(angle)

	position.x = radius * x_pos + current_center_point.x
	position.y = radius * y_pos + current_center_point.y
	
	if(health <= 0):
		queue_free()
		GameManager.total_money += money_drop
		GameManager.total_point += point
	

func set_label_text():
	for node : Node in get_children():
		if node is Label:
			node.text = key_label
			

func take_damage():
	health -= 1
	damage_indicator()
	change_circle()

func change_circle():
	angle -= 10
	if current_center_point == GameManager.center_left_circle:
		current_center_point = GameManager.center_right_circle
	else:
		current_center_point = GameManager.center_left_circle

func damage_indicator():
	self.modulate = Color(1,0,0)
	await get_tree().create_timer(0.1).timeout
	self.modulate = Color(1,1,1)
