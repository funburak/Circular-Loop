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
	var to_remove := []
	for enemy in enemy_group.duplicate():
		if event.is_action_pressed(enemy.key_label):
			enemy.take_damage()
			to_remove.append(enemy)

	for enemy in to_remove:
		enemy_group.erase(enemy)

	if event.is_action_pressed("A"):
		change_position("left")
	if event.is_action_pressed("D"):
		change_position("right")

func _physics_process(delta: float) -> void:
	if health <= 0:
		queue_free()

func take_damage(damage: int):
	if (health > 0):
		health -= damage

func change_position(position):
	var game = get_parent()
	if game:
		game.change_player_position(position)
		
