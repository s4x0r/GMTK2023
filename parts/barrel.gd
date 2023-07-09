extends KinematicBody

export var speed = 10
var hp = 10

var velocity = Vector3.ZERO
var target= null
var gravity = 14


# Called when the node enters the scene tree for the first time.
func _ready():
	axis_lock_motion_y=false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.


func _physics_process(delta):
	if hp<1:
		print([name, "died"])
		queue_free()

	var direction = Vector3.ZERO
	if target != null:
		#look_at(Vector3(target.translation.x, translation.y, target.translation.z), Vector3.UP)
		direction = translation - target.translation
		direction=Vector3(direction.x, translation.y, direction.z)
		look_at(direction, Vector3.UP)
		pass


	if get_last_slide_collision() != null:
		if get_last_slide_collision().collider.name == "swordcollider":
			hp-=3
			print([name, "damaged", 3])
			direction = direction*Vector3(-1, 0, -1)

	if direction != Vector3.ZERO:
		direction = -direction.normalized()


	velocity.x = direction.x * speed
	velocity.z = direction.z * speed
	
	#$body.look_at(to_global(velocity), Vector3.UP)
	if not is_on_floor():
		velocity.y -= gravity * delta

	velocity = move_and_slide(velocity, Vector3.UP)



	pass




func _on_Area_body_exited(body:Node):
	print([body, "exited"])
	target = null
	pass # Replace with function body.


func _on_Area_body_entered(body:Node):
	if body.name =="guy":
		target = body
		pass
	print([body, "entered"])
	pass # Replace with function body.
