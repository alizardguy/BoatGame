extends Node

# mouse state vars
var lockedMouse = true;

# Called when the node enters the scene tree for the first time.
func _ready():
	# Lock mouse
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED);

func _process(delta):
	# Toggle mouse lock
	if lockedMouse == true:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED);
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE);
