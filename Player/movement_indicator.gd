extends MeshInstance
var firing = false

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if visible:
		$AnimationPlayer.play("Fade_out")
		firing = true
	if firing:
		if not visible:
			get_parent().remove_child(self)
	pass
