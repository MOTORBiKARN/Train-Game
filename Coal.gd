extends RigidBody2D

func _ready():
	add_to_group("coal")
	
	var textures = [preload("res://assets/coal_1.png"),
					preload("res://assets/coal_2.png"),
					preload("res://assets/coal_3.png"),
					preload("res://assets/coal_4.png"),
					preload("res://assets/coal_5.png")]
	randomize()
	$Sprite.texture = textures[randi() % 5]
