class_name Enemy

extends AnimatedSprite2D

var radius = GameManager.radius
var angle: float = 0.0
var speed: float = 2.0

func _ready() -> void:
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	angle = rng.randf_range(0.0, TAU)

func _physics_process(delta: float) -> void:
	angle += speed * delta
	var x_pos = cos(angle)
	var y_pos = sin(angle)

	position.x = radius * x_pos + GameManager.center_left_circle.x
	position.y = radius * y_pos + GameManager.center_left_circle.y
