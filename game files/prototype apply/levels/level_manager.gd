extends Node2D

var levels = []
var num_levels = 2
var current_level = 1

func _ready() -> void:
	for index in num_levels:
		levels.append(load("res://game files/prototype apply/levels/level " + str(index + 1) + ".tscn"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func load_next_level():
	get_child(0).queue_free()
	add_child(levels[current_level].instantiate())
	current_level += 1

func load_level(num: int):
	current_level = num - 1
	load_next_level()
