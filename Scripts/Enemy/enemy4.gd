extends Enemy
@onready var label: Label = $Label
@onready var area_2d: Area2D = $Area2D

func _physics_process(delta: float) -> void:
	super._physics_process(delta)
	speed = 0.35
	damage = 20
	money_drop = 25
	point = 25
	if(health<=0):
		GameManager.enemy4_point += 1
