extends Area
var inside = false

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _input(event):
	if Input.is_action_just_pressed("left_click") and inside == true:
		get_tree().change_scene("res://Maps/Falu.tscn")


func _on_Area_mouse_entered():
	inside = true
	get_parent().get_node("select").visible = true
	pass # Replace with function body.


func _on_Area_mouse_exited():
	inside = false
	get_parent().get_node("select").visible = false
	pass # Replace with function body.
