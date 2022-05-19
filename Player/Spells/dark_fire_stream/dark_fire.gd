extends MeshInstance
var cooldown = 5
var status = 10
var activated = false
var animation = "Standing2HMagicAttack03"
var firing = false
var timer = 0
var dmg = 30
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func activate():	
	activated = true
	

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var casting = get_parent().get_parent().get_parent().anim_casting
	if casting and activated:
		self.visible = true
		firing = true
	if firing and not casting and activated:
		firing = false
		activated = false
		self.visible = false
		status = 10
		
	if firing:
		if timer <= 0:
			for area in $spell.get_overlapping_areas():
				print(area)
				if area.get_parent().is_in_group("enemy"):
						var enemy = area.get_parent()
						var vector = enemy.transform.origin.direction_to(get_parent().get_parent().get_parent().transform.origin)
						enemy.got_dmg(dmg,vector.normalized())
						timer = 0.5
		else:
			timer -=delta
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
