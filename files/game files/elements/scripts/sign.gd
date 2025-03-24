extends Area2D

@export var text = "text here"
@export var initial_state = false


func _ready() -> void:
	if !initial_state: $PanelContainer.hide()
	$PanelContainer/MarginContainer/Label.text = text.replace("\\n", "\n")


func _process(delta: float) -> void:
	pass





func _on_body_entered(body: Node2D) -> void:
	if body.is_class("TileMapLayer"): return
	#print(body)
	$PanelContainer.show()



func _on_body_exited(body: Node2D) -> void:
	#print(body)
	$PanelContainer.hide()
