extends Camera2D


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"

var bird;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bird = get_node("../bird");
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass

func _process(delta: float) -> void:
	set_position(Vector2(bird.get_position().x, get_position().y ) )
	pass

func get_total_position():
	return get_position() + get_offset();
