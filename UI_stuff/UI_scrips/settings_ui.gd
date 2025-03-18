extends Control
var menu = preload("res://UI_stuff/UI_scene/MENU_UI.tscn")
var credits = preload("res://UI_stuff/UI_scene/CREDITS.tscn")





func _on_c_button_pressed() -> void:
	get_parent().add_child(credits.instantiate())
	queue_free()





func _on_r_button_pressed() -> void:
	get_parent().add_child(menu.instantiate())
	queue_free()
