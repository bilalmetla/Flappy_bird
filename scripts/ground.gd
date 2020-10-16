extends StaticBody2D
# utils;

func get_main_node():
	var root_node = get_tree().get_root()
	return root_node.get_child(root_node.get_child_count()-1)
	pass


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
#const Utils = preload("utils.gd") # Relative path
#onready var utils = Utils.new()
onready var button_right = get_node("button-right")
var camera; 

# Called when the node enters the scene tree for the first time.
func _ready():
	var root_node = get_tree().get_root()
	camera = root_node.get_child(root_node.get_child_count()-1).get_node("Camera2D")
	pass # Replace with function body.

signal destroyed;
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if camera == null: return
	
	if button_right.get_global_position().x <= camera.get_total_position().x:
		queue_free()
		emit_signal("destroyed")
	pass
