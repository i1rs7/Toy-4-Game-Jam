extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"Level Complete".visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_ending_door_body_entered(body: Node2D) -> void:
	$"Level Complete".visible = true
	get_tree().paused = true
