extends Control


func _on_s_button_pressed() -> void:
	$SETTINGS_ui.show()


func _on_htp_button_pressed() -> void:
	$HTP_ui.show()


func _on_l_button_pressed() -> void:
	get_tree().quit()


func _on_r_button_pressed() -> void:
	get_parent().hide()
