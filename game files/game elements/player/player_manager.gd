extends Node2D

var player_scene = preload("res://game files/game elements/player/player.tscn")
var players = []
var selected_index = 0

func _ready() -> void:
	for child in get_children(): players.append(child) # put all children adresses into players list
	players[selected_index].set_meta("selected", true) # select current player: default is so we must select to start.

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"): cycle_selection()
	

func add_branch():
	var branch = player_scene.instantiate() # create new player
	# move new player to desired position
	# add player ID
	# select new player, deselect old
	get_parent().add_child(branch) # add new player to manager scene
	pass

func cycle_selection():
	players[selected_index].set_meta("selected", false) # deselect current player
	selected_index = (selected_index + 1) % players.size() # cycle index
	players[selected_index].set_meta("selected", true) # select new player
	
