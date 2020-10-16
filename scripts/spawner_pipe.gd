extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const scn_pipe = preload("res://scenes/pipe.tscn");
const pipe_width = 20;
const offset_y = 55;
const offset_x = 65;
const ground_height = 56;
const amount_to_fill_with = 2;

# Called when the node enters the scene tree for the first time.
func _ready():
	get_init_position();
#	spawner_pipe()
	for i in range(amount_to_fill_with):
		spawn_and_move();
	pass # Replace with function body.


func spawn_and_move():
	spawner_pipe()
	next_position();

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func spawner_pipe():
	var new_pipe = scn_pipe.instance()
	new_pipe.set_position(get_position())
	new_pipe.connect("destroy_pipe", self, "spawn_and_move");
	get_node("container").add_child(new_pipe)

func get_init_position():
	randomize();
	var next_pos = Vector2();
	next_pos.x =   get_viewport_rect().size.x + pipe_width/2 
	next_pos.y = rand_range(0+offset_y,  get_viewport_rect().size.y -ground_height - offset_y )
	set_position(next_pos)

func next_position():
	var x =  get_viewport_rect().size.x + offset_x
	#var y = get_viewport_rect().size.y/2 - ground_height - offset_y 
	#var next_pos = get_position();
	#next_pos.x = pipe_width/2 +  offset_x + pipe_width/2;
	#next_pos.y = rand_range(0+offset_y,  get_viewport_rect().size.y -ground_height - offset_y )
	#print("get_position", get_position())
	#print ("get_viewport_rect.x" , get_viewport_rect().size.x)
	#print ("get_viewport_rect.y" , get_viewport_rect().size.y)
	#print ("x:",x);
	#print ("y:",y);
	#next_pos.x = x;
	#next_pos.y = y;
	#set_position(next_pos);
	var next = get_position();
	if next.y >= 130:
		next.y = rand_range(40, 130)
	set_position(next + Vector2(x, rand_range(0, 10) ) )
