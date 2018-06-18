extends Node2D

export (PackedScene) var coal
var timer = 0
var thyme = 0

func _ready():
	spawn_coal()

func _physics_process(delta):
	timer += delta
	thyme += delta
	if timer >= 1:
		spawn_coal()
		timer = 0
		
	if Input.is_action_pressed("ui_accept"):
		if thyme > 0.5:
			spawn_coal()
			thyme = 0

func spawn_coal():
	var new_coal = coal.instance()
	new_coal.position = position
	get_node("../coals").add_child(new_coal, true)