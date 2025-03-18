extends Control
var rtm = preload("res://UI_stuff/UI_scene/MENU_UI.tscn")


func _on_r_button_pressed() -> void:
	get_parent().add_child(rtm.instantiate())
	queue_free()
