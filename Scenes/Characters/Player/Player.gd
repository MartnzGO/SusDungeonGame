extends KinematicBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.




# Called every frame. 'delta' is the elapsed time since the previous frame.
func move(vector):
	move_and_slide(vector*2)
	
	$AnimationPlayer.play("Running-loop")
	var vect2p = vector-global_transform.origin
	var angle = Vector2(Vector2(global_transform.origin.x,global_transform.origin.z-1)-Vector2(global_transform.origin.x,global_transform.origin.z)).angle_to(Vector2(vect2p.x,vect2p.z))

#	var basevector = $Player.transform.origin+vector
#	var lookat = Vector3(basevector.x,basevector.y+3,basevector.z)

	get_node("Armature").look_at(transform.origin-vector,Vector3.UP)
	get_node("Armature").set_rotation(Vector3(0,$Armature.rotation.y,0))
#	var plusrad = deg2rad(-180)

#	var cube = load("res://Spatial.tscn").instance()
#	var tempvec = vector.normalized()
#	cube.transform.origin = transform.origin + Vector3(tempvec.x,2,tempvec.z)
#	get_parent().add_child(cube)
#
	#angle = rad2deg(angle)
	#$Player.set_rotation(rotation-Vector3(0,angle,0))
	
func idle():
	
	$AnimationPlayer.play("drunk")
