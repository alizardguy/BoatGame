extends Control

var player_vars;
var hp_display;

# Called when the node enters the scene tree for the first time.
func _ready():
	player_vars = get_node("/root/PlayerVariables");
	hp_display = get_node("HPdebug");


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	hp_display.text = str(player_vars.playerHealth) + "/" + str(player_vars.maxHealth) + " HP";
	pass
