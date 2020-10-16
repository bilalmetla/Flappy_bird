extends Node2D


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"

const scn_ground = preload("res://scenes/ground.tscn");
const AMOUNT_TO_FILL_VIEW = 2;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	for i in range(AMOUNT_TO_FILL_VIEW):
		spawner_ground();
		next_ground();
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
func span_and_move():
	spawner_ground();
	next_ground();
	pass;

func spawner_ground():
	var new_ground = scn_ground.instance();
	new_ground.set_position(get_position())
	new_ground.connect("destroyed", self, "spawner_ground")
	new_ground.connect("destroyed", self, "next_ground")
	get_node("container").add_child(new_ground)
	pass



func next_ground():
	#var new_ground = scn_ground.instance();
	#new_ground.set_position(get_position()+ Vector2(168, 0))
	
	#get_node("container").add_child(new_ground)
#	new_ground.connect("exit_tree", self, "next_ground")
	set_position(get_position() + Vector2(168, 0))
	pass;
