extends Area2D

@export var text = "text here"
@export var initial_state = false


func _ready() -> void:
	if !initial_state: $PanelContainer.hide()
	$PanelContainer/MarginContainer/Label.text = text.replace("\\n", "\n")

func _process(_delta: float) -> void:
	pass






func _on_body_entered(body: Node2D) -> void:
	if body.is_class("TileMapLayer"): return
	$PanelContainer.show()



func _on_body_exited(_body: Node2D) -> void:
	$PanelContainer.hide()
