extends Camera


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _unhandled_input(event):
	if event.is_action_pressed("zoomin"):
		var vector = get_parent().get_node("Armature").transform.origin
		var vector_to_player = vector-transform.origin
		var normal = (vector-transform.origin).normalized()
		

		if vector_to_player.length() > 7:
			transform.origin+=normal
	if event.is_action_pressed("zoomout"):
		var vector = get_parent().get_node("Armature").transform.origin
		var vector_to_player = vector-transform.origin
		var normal = (vector-transform.origin).normalized()
		if vector_to_player.length() <20:
			transform.origin-=normal
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
