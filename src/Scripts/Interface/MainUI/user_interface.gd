extends Control

var player_vars;

# node paths for UI parts
@export_node_path("Control") var _debug_holder:NodePath;
@export_node_path("Label") var _fps_display:NodePath;
@export_node_path("Label") var _hp_display:NodePath;


# get nodes
var debug_holder:Control;
var fps_display:Label;
var hp_display:Label;

# Called when the node enters the scene tree for the first time.
func _ready():
	# Get global vars
	player_vars = get_node("/root/PlayerVariables");
	
	# Get nodes for UI parts
	debug_holder = get_node_or_null(_debug_holder);
	hp_display = get_node_or_null(_hp_display);
	fps_display = get_node_or_null(_fps_display)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	hp_display.text = str(player_vars.health) + "/" + str(player_vars.max_health) + " HP";
	fps_display.text = str(Engine.get_frames_per_second()) + " FPS";
	# Toggle debug 
	if Input.is_action_just_pressed("toggle_debug"):
		toggle_debug();

# Toggle debug UI
func toggle_debug():
	debug_holder.visible = !debug_holder.visible;
