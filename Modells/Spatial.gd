extends KinematicBody
var state = ""
var pressed_skill = ""



export var health = 200
export var mana = 100
var _mana = 200
var _health = 200

func got_dmg(damage, vector):
	health-=damage
	if health < 0:
		get_tree().change_scene('res://title_screen/TitleScreen.tscn')

func _ready():
	$Player/Health.set_max(health)
	$Player/Health.set_current(health)
	$Player/Mana.set_max(mana)
	$Player/Mana.set_current(mana)
	pass

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
	if mana != _mana:
		_mana = mana
		$Player/Mana.set_current(mana)
		mana = mana+0.01
	if health != _health:
		_health = health
		$Player/Health.set_current(health)
	pass


func idle():
	if state != "cast":
		$Player/AnimationPlayer.play("BreathingIdle")
	
func _input(event):
	if Input.is_key_pressed(KEY_Q) and $Skills/Q/scene.can_cast:
		state = "cast"
		pressed_skill = "q"
		$Player/AnimationPlayer.play("Standing2HCastSpell01")
		$Player/AuxScene/Node2/Skeleton/BoneAttachment/Spatial.visible = true
		$Player/AuxScene/Node2/Skeleton/BoneAttachment2/Spatial.visible = true
		
		
