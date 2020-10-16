extends StaticBody2D

func get_main_node():
	var root_node = get_tree().get_root()
	return root_node.get_child(root_node.get_child_count()-1)
	pass
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var right = get_node("right")
var camera; 

# Called when the node enters the scene tree for the first time.
func _ready():
	var root_node = get_tree().get_root()
	camera = root_node.get_child(root_node.get_child_count()-1).get_node("Camera2D")
	pass # Replace with function body.

signal destroy_pipe;
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if camera == null: return
	
	if right.get_global_position().x <= camera.get_total_position().x:
		queue_free()
		emit_signal("destroy_pipe")
	pass
