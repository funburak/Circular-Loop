extends Control



func _on_return_to_game_button_pressed() -> void:
	hide()
	Engine.time_scale = 1
	GameManager.game_is_paused = false
	
func _on_return_to_mainmenu_button_pressed() -> void:
	pass # Replace with function body.
