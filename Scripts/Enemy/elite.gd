extends Enemy

func _physics_process(delta: float) -> void:
	super._physics_process(delta)
	speed = 1.75
	damage = 25
	money_drop = 10
	point = 100
	if(health<=0):
		GameManager.elite_point += 1
	print(health)
