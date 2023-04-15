extends Node3D

# camera setting vars
var lookSensitivity : float = 15.0; # todo: expose to settings menu later
var minLookAngle : float = -55.0;
var maxLookAngle : float = 20.0;

# proccessing vars
var mouseDelta : Vector2 = Vector2();

@onready var player = get_parent();

func _input(event):
	
	if event is InputEventMouseMotion:
		mouseDelta = event.relative;

func _process(delta):
	
	var rot = Vector3(mouseDelta.y, mouseDelta.x, 0) * lookSensitivity * delta;
	
	rotation_degrees.x += rot.x;
	rotation_degrees.x = clamp(rotation_degrees.x, minLookAngle, maxLookAngle);
	
	player.rotation_degrees.y -= rot.y;
	
	mouseDelta = Vector2(); #Clear out mouseDelta
