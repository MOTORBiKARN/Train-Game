extends AnimatedSprite

var tima = 0

func _ready():
	set_process(true)

func _process(delta):
	tima += delta
	if tima > 1:
		self.queue_free()
		tima = 0
