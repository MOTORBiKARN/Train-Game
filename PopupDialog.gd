extends PopupDialog

func _ready():
	get_node("Button").connect("button_down", self, "quit")
	pass

func quit():
	get_tree().quit()
