@icon("res://Assets/Images/Icons/Class/redDot.png")

class_name CollectibleItemBase

extends Node3D

var collect_value: float;
var collect_type: String;

func collected():
	print("collected");

# Called when the node enters the scene tree for the first time.
func _ready():
	print("collectible in scene");
