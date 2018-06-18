extends Camera2D

var speed = 0.4 setget speed_set, speed_get

func speed_set(new_value):
    speed = new_value

func speed_get():
    return speed # Getter must return a value

func _process(delta):
	translate(Vector2(200*speed*delta, 0))