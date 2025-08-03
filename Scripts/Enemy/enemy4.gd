extends Enemy
@onready var label: Label = $Label
@onready var area_2d: Area2D = $Area2D

func _physics_process(delta: float) -> void:
	super._physics_process(delta)
	speed = 0.5
	damage = 25
	money_drop = 25
	point = 50
	if(health<=0):
		GameManager.enemy4_point += 1
