extends Node2D

var player_scene = preload("res://game files/game elements/player/player.tscn")
var players = [] # holds adresses of all children
var selected_index = 0 # holds index of selected child

func _ready() -> void:
	for child in get_children(): players.append(child) # put all children adresses into players list
	players[selected_index].set_meta("selected", true) # select current player: default is so we must select to start.


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"): cycle_selection()
	if Input.is_action_just_pressed("spawn"): add_branch()


func add_branch():
	var branch = player_scene.instantiate() # create instance
	branch.attributes = players[selected_index].attributes.duplicate() # copy attributes over
	branch.position = players[selected_index].position + Vector2(20,0) # move new player to desired position
	players.append(branch) # add player ID
	# note that we must add child before setting meta, I think because the meta is on the node, and not the object or something.
	add_child(branch) # add new player to children
	players[selected_index].set_meta("selected", false) # deselect current player
	selected_index = players.size() - 1 # update selected index to be new player
	players[selected_index].set_meta("selected", true) # select new player

func cycle_selection():
	players[selected_index].set_meta("selected", false) # deselect current player
	selected_index = (selected_index + 1) % players.size() # cycle index
	players[selected_index].set_meta("selected", true) # select new player
