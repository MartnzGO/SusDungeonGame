extends KinematicBody

var timer =2
var attck_speed = 2
var dmg = 28
var health = 100
var staggered = false
var stagger_timer = 2
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if staggered:
		if stagger_timer > 0:
			stagger_timer-= delta
		else:
			staggered = false
			
	if not staggered:
		for area in $notice.get_overlapping_areas():
			if area.get_parent().is_in_group("player"):
				var player = area.get_parent()
				var vector = transform.origin.direction_to(player.transform.origin)
				move_and_slide(vector.normalized()*10)
		for area in $dmg.get_overlapping_areas():
			if area.get_parent().is_in_group("player"):
				if timer < 0:
					$MeshInstance.visible = true
					var player = area.get_parent()
					var vector = transform.origin.direction_to(player.transform.origin)
					player.got_dmg(dmg,vector.normalized()*10)
					print(player.health)
					timer = attck_speed
		if timer > 0:
			timer -=delta
		if timer < attck_speed/2 and $MeshInstance.visible:
			$MeshInstance.visible = false
					

func got_dmg(dmg,vector):
	health-=dmg
	move_and_slide(vector*100)
	staggered = true
	stagger_timer = 1
	if health < 0:
		get_parent().remove_child(self)
