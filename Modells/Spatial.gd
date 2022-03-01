extends KinematicBody
var state = ""
var pressed_skill = ""
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.




# Called every frame. 'delta' is the elapsed time since the previous frame.
func move(vector):
	if state != "cast":
		move_and_slide(vector)
		$Player/AnimationPlayer.play("SlowRun")
		var vect2p = vector-global_transform.origin
		var angle = Vector2(Vector2(global_transform.origin.x,global_transform.origin.z-1)-Vector2(global_transform.origin.x,global_transform.origin.z)).angle_to(Vector2(vect2p.x,vect2p.z))
		
		
	#	var basevector = $Player.transform.origin+vector
	#	var lookat = Vector3(basevector.x,basevector.y+3,basevector.z)

		$Player.look_at(transform.origin-vector,Vector3.UP)
		$Player.set_rotation(Vector3(0,$Player.rotation.y,0))
	#	var plusrad = deg2rad(-180)

#	var cube = load("res://Spatial.tscn").instance()
#	var tempvec = vector.normalized()
#	cube.transform.origin = transform.origin + Vector3(tempvec.x,2,tempvec.z)
#	get_parent().add_child(cube)

	#angle = rad2deg(angle)
	#$Player.set_rotation(rotation-Vector3(0,angle,0))
func _process(delta):
	if state == "cast":
		if !$Player/AnimationPlayer.is_playing():
			get_node("Skills").get_node(pressed_skill.capitalize()).get_child(0).activate()
			$Player/AuxScene/Node2/Skeleton/BoneAttachment/Spatial.visible = false
			$Player/AuxScene/Node2/Skeleton/BoneAttachment2/Spatial.visible = false
			pass
	if !$Player/AnimationPlayer.is_playing():
		print("process_delta")
		print(state)
		state=""
		$Player/AnimationPlayer.play("BreathingIdle")
	pass
	
	
func idle():
	if state != "cast":
		$Player/AnimationPlayer.play("BreathingIdle")
	
func _input(event):
	if Input.is_key_pressed(KEY_Q):
		state = "cast"
		pressed_skill = "q"
		$Player/AnimationPlayer.play("Standing2HCastSpell01")
		$Player/AuxScene/Node2/Skeleton/BoneAttachment/Spatial.visible = true
		$Player/AuxScene/Node2/Skeleton/BoneAttachment2/Spatial.visible = true
		print("yassss")
		
