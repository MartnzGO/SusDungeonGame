extends Spatial
var cooldown = 10
var status = 10
var activated = false
var can_cast = true
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func activate():
	activated = true
	self.visible = true
	get_parent().get_parent().get_parent().get_parent().SPEED+=20
	can_cast = false
	get_parent().get_parent().get_parent().mana -=25

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if activated:
		status-=delta
		cooldown-=delta
	if cooldown < 0:
		can_cast = true
		cooldown = 10
	if status<0:
		activated = false
		self.visible = false
		get_parent().get_parent().get_parent().get_parent().SPEED-=20
		status = 10
	pass


