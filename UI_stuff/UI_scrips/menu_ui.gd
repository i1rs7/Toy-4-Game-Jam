extends Control
var settings = preload("res://UI_stuff/UI_scene/SETTINGS_UI.tscn")
var htp = preload("res://UI_stuff/UI_scene/HTP_UI.tscn")



func _on_s_button_pressed() -> void:
	get_parent().add_child(settings.instantiate())
	self.queue_free()


func _on_htp_button_pressed() -> void:
	get_parent().add_child(htp.instantiate())
	self.queue_free()


func _on_l_button_pressed() -> void:
	get_tree().quit()


func _on_r_button_pressed() -> void:
	print(get_parent())
	get_parent().resume()
