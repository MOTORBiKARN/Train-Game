extends RigidBody2D

# Angles are floats in radians => 2pi = 1tau = 360deg
export(float) var wanted_angle = 0
export var drag_speed = 500
export var rotation_speed = 160

func _ready():
	add_to_group("shovel")
	set_physics_process(true)
	pass

func _integrate_forces(state):
	if Input.is_action_pressed("ui_left"):
		state.angular_velocity -= rotation_speed*state.step
	elif Input.is_action_pressed("ui_right"):
		state.angular_velocity += rotation_speed*state.step
	if Input.is_action_pressed("lmb"):
		if mouse_on_bottom_screen():
			var shovel2mouse = get_viewport().get_mouse_position() - self.position
			state.linear_velocity = shovel2mouse*drag_speed*state.step

func mouse_on_bottom_screen():
	var mpos = get_viewport().get_mouse_position()
	return mpos.x >= 0 and mpos.x <= 360 and mpos.y >= 0 and mpos.y <= 135

func burn(woosh):
	print(rotation+0.2)
	for i in range(8):
		var woo = woosh.instance()
		woo.position = Vector2(position.x + cos(rotation)*(i*12 - 42), 
				position.y + sin(rotation)*(i*12-56))
		get_parent().add_child(woo, true)
	
	queue_free()
	pass
	
