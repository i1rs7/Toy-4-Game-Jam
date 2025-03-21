extends StaticBody2D

@export var connections = []


func _ready() -> void:
	pass


func _process(_delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_class("TileMapLayer"): return
	if body == self: return
	for element in connections:
		get_node(element).state = true

func _on_area_2d_body_exited(_body: Node2D) -> void:
	for element in connections:
		get_node(element).state = false
