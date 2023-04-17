extends Node3D

# camera setting vars
var look_sensitivity : float = 15.0; # todo: expose to settings menu later
var min_lookAngle : float = -55.0;
var max_lookAngle : float = 20.0;

# proccessing vars
var mouseDelta : Vector2 = Vector2();

@onready var player = get_parent();

func _input(event):
	
	if event is InputEventMouseMotion:
		mouseDelta = event.relative;

func _process(delta):
	
	var rot = Vector3(mouseDelta.y, mouseDelta.x, 0) * look_sensitivity * delta;
	
	rotation_degrees.x += rot.x;
	rotation_degrees.x = clamp(rotation_degrees.x, min_lookAngle, max_lookAngle);
	
	player.rotation_degrees.y -= rot.y;
	
	mouseDelta = Vector2(); #Clear out mouseDelta
