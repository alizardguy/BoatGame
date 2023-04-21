@icon("res://Assets/Images/Icons/Class/redDot.png")

class_name CollectibleItemBase

extends Node3D

# position item started in
@onready var default_pos = get_position();

# idk yet
var collect_value: float;
var collect_type: String;

func collected():
	print("collected");

# Called when the node enters the scene tree for the first time.
func _ready():
	print("collectible in scene");

func _process(_delta):
	pass # make float up and down effect
