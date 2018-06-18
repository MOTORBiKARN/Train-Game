extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	var textures = [preload("res://assets/coal_1.png"),
			preload("res://assets/coal_2.png"), 
			preload("res://assets/coal_3.png"), 
			preload("res://assets/coal_4.png"),
			preload("res://assets/coal_5.png")]
	randomize()
	$Sprite.texture = textures[randi() % 5]

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
