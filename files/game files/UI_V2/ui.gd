extends Control


@onready var main_menu: Panel = $"AspectRatioContainer/MarginContainer/Main Menu"

@onready var settings: Panel = $AspectRatioContainer/MarginContainer/Settings
@onready var how_to_play: Panel = $"AspectRatioContainer/MarginContainer/How To Play"
@onready var level_select: Panel = $"AspectRatioContainer/MarginContainer/Level Select"
@onready var credits: Panel = $AspectRatioContainer/MarginContainer/Credits







func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("pause") and visible: hide()
	elif Input.is_action_just_pressed("pause") and not visible: show()




# MAIN MENU BUTTONS
func _on_settings_button_button_up() -> void:
	main_menu.hide()
	settings.show()

func _on_how_to_play_button_button_up() -> void:
	main_menu.hide()
	how_to_play.show()

func _on_level_select_button_button_up() -> void:
	main_menu.hide()
	level_select.show()

func _on_credits_button_button_up() -> void:
	main_menu.hide()
	credits.show()

func _on_resume_button_button_up() -> void:
	hide()




# SETTINGS BUTTON
func _on_settings_back_button_button_up() -> void:
	settings.hide()
	main_menu.show()

# HOW TO PLAY BUTTON
func _on_how_to_play_back_button_button_up() -> void:
	how_to_play.hide()
	main_menu.show()

# LEVEL SELECT BUTTON
func _on_level_select_back_button_button_up() -> void:
	level_select.hide()
	main_menu.show()

# CREDITS BUTTON
func _on_credits_back_button_button_up() -> void:
	credits.hide()
	main_menu.show()
