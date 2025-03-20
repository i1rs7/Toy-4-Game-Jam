extends Node2D

var levels = []
var num_levels = 1

func _ready() -> void:
	for index in num_levels:
		levels.append(load("res://game files/prototype apply/levels/level " + str(index) + ".tscn"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
