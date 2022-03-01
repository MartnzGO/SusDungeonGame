extends StaticBody
var state = "closed"
onready var anim = get_parent().get_parent().get_node("AnimationPlayer")
onready var collision = get_node("CollisionShape")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _input_event(camera, event, click_position, click_normal, shape_idx):
	if Input.is_action_just_released("mouse_down_left"):
		if state == "closed":
				anim.play("Open")
				state = "open"
				collision.disabled = true
				return
		if state =="open":
			anim.play("Close")
			state="closed"
			collision.disabled = false
