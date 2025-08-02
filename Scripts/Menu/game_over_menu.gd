extends Control

@onready var label: Label = $Label

func _ready() -> void:
	label.text = " Your \n Score is:" + "\n "+str(GameManager.total_point) 


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Menu/main_menu.tscn") 
