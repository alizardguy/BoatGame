extends CharacterBody3D

# Player locomotion vars
var current_speed : float = 0;
const walk_speed : float = 5.0;
const run_speed : float = 7.0;
const jump_velocity : float = 4.5;

# global vars
@onready var player_vars = get_node("/root/PlayerVariables");

# Get third person player camera
@export_node_path("Camera3D") var _player_camera:NodePath;
@export_node_path("SpringArm3D") var _camera_spring:NodePath;
@onready var player_camera: Camera3D = get_node_or_null(_player_camera);
@onready var camera_spring: SpringArm3D = get_node_or_null(_camera_spring);

# Get player collider
@onready var main_collider : CollisionShape3D = get_node("main_collider");

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready():
	current_speed = walk_speed;

# main physics process
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta;

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_velocity;

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("move_left", "move_right", "move_up", "move_down");
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized();
	if direction:
		velocity.x = direction.x * current_speed;
		velocity.z = direction.z * current_speed;
	else:
		velocity.x = move_toward(velocity.x, 0, current_speed);
		velocity.z = move_toward(velocity.z, 0, current_speed);
		
	move_and_slide();
	
	# toggle run
	if Input.is_action_just_pressed("move_run"):
		start_move_run();
	if Input.is_action_just_released("move_run"):
		end_move_run();
	
	# toggle crouch
	if Input.is_action_just_pressed("move_crouch"):
		toggle_move_crouch(true);
	if Input.is_action_just_released("move_crouch"):
		toggle_move_crouch(false);

# player run toggle
func start_move_run(): #start sprinting
	current_speed = run_speed;
	_tween_fov(80, 0.1);

func end_move_run(): #end sprinting
	current_speed = walk_speed;
	_tween_fov(player_vars.fov, 0.1);

func _tween_fov(FOV, SPEED):
	var tween = get_tree().create_tween()
	tween.tween_property(player_camera, "fov", FOV, SPEED);

# crouch toggle
func toggle_move_crouch(state):
	if state == true:
		main_collider.shape.height = 0.7;
	elif state == false:
		main_collider.shape.height = 1;
