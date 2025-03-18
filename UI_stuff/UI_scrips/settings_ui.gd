extends Control




func _on_s_button_pressed() -> void:
	pass


func _on_c_button_pressed() -> void:
	get_tree().change_scene_to_file("res://CREDITS.tscn")


func _on_r_button_pressed() -> void:
	get_tree().change_scene_to_file("res://MENU_UI.tscn")
