extends Node

export (PackedScene) var woosh
export (PackedScene) var popup
var temperature

func _ready():
	get_node("bottom_screen/Viewport/Furnace").connect("body_entered", self, "entered_furnace")
	temperature = 0.4

func do_temperature_stuff():
	get_node("top_screen/Viewport/Camera2D").speed = temperature
	get_node("bottom_screen/Viewport/Furnace/AnimatedSprite").scale = Vector2(temperature*1.8+0.2,temperature*1.8+0.2)
	get_node("bottom_screen/Viewport/TempGauge/pivot").rotation = temperature*PI
	get_node("top_screen/Viewport/Parallax/ParallaxLayer0/Train/Particles2D2").scale = Vector2(0.4+temperature*0.6,-(0.4+temperature*0.6))

func _physics_process(delta):
	temperature -= 0.02*delta
	do_temperature_stuff()
	if temperature <= 0:
		get_node("PopupDialog/Label").text = "You freeze to death :("
		get_node("PopupDialog").popup(Rect2(0,0,360,270))
		temperature = 0
	if temperature >= 1:
		get_node("PopupDialog/Label").text = "You burn to death :("
		get_node("PopupDialog").popup(Rect2(0,0,360,270))	
		temperature = 1.1
	

func entered_furnace(body):
	if body.is_in_group("coal"):
		var new_woosh = woosh.instance()
		new_woosh.position = body.position
		get_node("bottom_screen/Viewport/coals").add_child(new_woosh, true)
		temperature += 0.03
		body.queue_free() # delete the piece of coal
	if body.is_in_group("shovel"):
		temperature += 0.1
		body.burn(woosh)
		pass
