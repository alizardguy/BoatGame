extends Control

var player_vars;

# debug UI slots
var DebugHolder;
var HpDisplay;
var FpsDisplay;


# Called when the node enters the scene tree for the first time.
func _ready():
	player_vars = get_node("/root/PlayerVariables");
	HpDisplay = get_node("debug/hp_debug");
	FpsDisplay = get_node("debug/fps_debug");
	DebugHolder = get_node("debug");


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	HpDisplay.text = str(player_vars.playerHealth) + "/" + str(player_vars.maxHealth) + " HP";
	FpsDisplay.text = str(Engine.get_frames_per_second()) + " FPS";
	# Toggle debug 
	if Input.is_action_just_pressed("toggle_debug"):
		toggle_debug();

# Toggle debug UI
func toggle_debug():
	DebugHolder.visible = !DebugHolder.visible;
