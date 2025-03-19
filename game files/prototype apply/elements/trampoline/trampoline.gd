extends StaticBody2D


@export var state = true
@onready var disable_box_top: MeshInstance2D = $DisableBoxTop
@onready var disable_box_right: MeshInstance2D = $DisableBoxRight
@onready var disable_box_left: MeshInstance2D = $DisableBoxLeft
@onready var disable_box_collision: CollisionShape2D = $DisableBoxCollision

func _ready() -> void:
	hide_disable_box()
	pass


func _process(_delta: float) -> void:
	if state: enable()
	else: disable()
	
func play_animation():
	$AnimatedSprite2D.play()


func disable():
	$AnimatedSprite2D.show()
	show_disable_Box()
	state = false

func enable():
	hide_disable_box()
	$AnimatedSprite2D.show()
	
	state = true

func hide_disable_box():
	disable_box_top.hide()
	disable_box_left.hide()
	disable_box_right.hide()
	disable_box_collision.disabled = true

func show_disable_Box():
	disable_box_top.show()
	disable_box_left.show()
	disable_box_right.show()
	disable_box_collision.disabled = false
	
