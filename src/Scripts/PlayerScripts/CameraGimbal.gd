extends Node3D

var rotating = false;

var prev_mouse_position;
var next_mouse_position;

var xChange = 0;


func _process(delta):
	# Camera pan
	if (Input.is_action_just_pressed("camera_drag_click")):
		rotating = true;
		prev_mouse_position = get_viewport().get_mouse_position()
	if (Input.is_action_just_released("camera_drag_click")):
		rotating = false;
#		print(rotation.x)
	if rotating:
		next_mouse_position = get_viewport().get_mouse_position()
		xChange = (next_mouse_position.y - prev_mouse_position.y) * .1 * delta
		rotate_x(-xChange);
		if rotation.x < -1.466:
			rotation.x = -1.466
		elif rotation.x > 0.224:
			rotation.x = 0.224;
		# rotate_y((next_mouse_position.x - prev_mouse_position.x) * .1 * delta) look left and right
		prev_mouse_position = next_mouse_position
	# camera zoom
	if (Input.is_action_just_pressed("camera_zoom_in")):
		print("zoomIn")
	if (Input.is_action_just_pressed("camera_zoom_out")):
		print("zoomOut")
	# reset zoom
	if (Input.is_action_just_pressed("camera_zoom_reset")):
		print("resetZoom")
