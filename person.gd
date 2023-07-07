extends KinematicBody

var target = Vector3.ZERO


var thirst_rate = 1
var thirst_max = 100
var thirst = 0
var money = 0
var home = "none"
var speed = 5
var velocity = Vector3.ZERO


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	thirst += thirst_rate

	var direction = Vector3.ZERO
	if target !=Vector3.ZERO:#target
		var distance = (translation-target)
		if abs(distance.x)>0.5 && abs(distance.y)>0.5:#reached target
			target = Vector3.ZERO
		else:
			direction= distance.normalized()


	else:#no target
		if thirst > thirst_max:
			#find stand
			pass
		else:
			#find road
			pass
	

	var areas=$Area.get_overlapping_areas()
	




	velocity.x = direction.x * speed
	velocity.z = direction.z * speed
	#velocity.y -= fall_acceleration * delta
	velocity = move_and_slide(velocity, Vector3.UP)

