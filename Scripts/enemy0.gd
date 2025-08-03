extends Enemy
@onready var label: Label = $Label
@onready var area_2d: Area2D = $Area2D

func _physics_process(delta: float) -> void:
	super._physics_process(delta)
	speed = 1.05
	damage = 10
	money_drop = 10
	point = 50
	if(health<=0):
		GameManager.enemy0_point += 1
