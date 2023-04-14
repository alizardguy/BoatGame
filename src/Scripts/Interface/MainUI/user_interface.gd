extends Control

var player_vars;
var hp_display;
var fps_display;

# Called when the node enters the scene tree for the first time.
func _ready():
	player_vars = get_node("/root/PlayerVariables");
	hp_display = get_node("hp_debug");
	fps_display = get_node("fps_debug");


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	hp_display.text = str(player_vars.playerHealth) + "/" + str(player_vars.maxHealth) + " HP";
	fps_display.text = str(Engine.get_frames_per_second()) + " FPS";
