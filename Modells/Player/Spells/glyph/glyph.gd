extends Spatial
var cooldown = 5
var status = 10
var activated = false

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func activate():
	activated = true
	self.visible = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if activated:
		status-=delta
	if status<0:
		activated = false
		self.visible = false
		status = 10
	pass
