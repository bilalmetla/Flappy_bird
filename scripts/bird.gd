extends RigidBody2D


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#print("ready func..");
	set_linear_velocity(Vector2(40, get_linear_velocity().y))
	set_process_input(true);
	set_process(true);
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass

func _process(delta: float) -> void:
	pass;

#this is manual way to take input keys and there actions
func _input1(event):
	if event is InputEventKey:
		if event.pressed and event.scancode == KEY_SPACE and event.is_pressed():
			print('input KEY_SPACE is tiregred.');

func flap():
	#print("flap set_linear_velocity", get_linear_velocity())
	set_linear_velocity(Vector2(get_linear_velocity().x, -100))
	set_angular_velocity(-3);

func _input(event):
	if Input.is_action_pressed("flap"):
#		print('action pressd');
		flap();
