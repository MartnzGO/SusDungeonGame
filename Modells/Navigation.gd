extends Navigation
var SPEED = 24
var path = []
var mouse_pos
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var robot  = get_node("Spatial")
onready var camera = get_node("Spatial/Camera")

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(true)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.

func _physics_process(delta):
	var direction = Vector3()
	if Input.is_action_pressed("mouse_down"):
		path = []
		var from = camera.project_ray_origin(camera.get_viewport().get_mouse_position())
		var to = from + camera.project_ray_normal(camera.get_viewport().get_mouse_position()) * 1000
		
		var target_point = get_closest_point_to_segment(from, to)
		path = get_simple_path(robot.translation, target_point, true)
			
#		print(path[0])
#		for v in path:
###
#			var cube = load("res://Spatial.tscn").instance()
#			cube.transform.origin = v
#			get_parent().add_child(cube)

	# We need to scale the movement speed by how much delta has passed,
	# otherwise the motion won't be smooth.
	var step_size = 1

	if path.size() > 1:
		# Direction is the difference between where we are now
		# and where we want to go.
		var destination = path[1]
		direction = destination - robot.translation
		# If the next node is closer than we intend to 'step', then
		# take a smaller step. Otherwise we would go past it and
		# potentially go through a wall or over a cliff edge!
		if step_size > direction.length():
			# We should also remove this node since we're about to reach it.
			path.remove(0)

		# Move the robot towards the path node, by how far we want to travel.
		# Note: For a KinematicBody, we would instead use move_and_slide
		# so collisions work properly.
		var tempvec = direction + Vector3(0,0,0)
		
		robot.move(tempvec.normalized() * SPEED)

		
	else:
		robot.idle()
		




