extends Control

var player_vars;

# debug UI slots
var debug_holder;
var hp_display;
var fps_display;


# Called when the node enters the scene tree for the first time.
func _ready():
	player_vars = get_node("/root/PlayerVariables");
	hp_display = get_node("debug/hp_debug");
	fps_display = get_node("debug/fps_debug");
	debug_holder = get_node("debug");


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
