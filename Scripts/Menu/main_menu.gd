extends Node


func _on_start_game_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main.tscn")


func _on_volume_slider_value_changed(value: float) -> void:
	GameManager.volume_float_value = value
