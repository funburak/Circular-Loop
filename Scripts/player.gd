class_name Player

extends AnimatedSprite2D

var enemy_group: Array[Enemy]

var health : int = 100

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area:
		var enemy = area.get_parent() as Enemy
		if enemy:
			enemy_group.append(enemy)

func _on_area_2d_area_exited(area: Area2D) -> void:
	var enemy = area.get_parent() as Enemy
	if enemy && enemy_group.has(enemy):
		enemy_group.erase(enemy)
		take_damage(enemy.damage)

func _input(event):
	for enemy : Enemy in enemy_group:
		if event.is_action_pressed(enemy.key_label):
			enemy.take_damage()
			enemy_group.erase(enemy) # Eren solved
			

func _physics_process(delta: float) -> void:
	if health <= 0:
		queue_free()


func take_damage(damage: int):
	if (health > 0):
		health -= damage
		print(health)
