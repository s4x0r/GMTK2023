extends KinematicBody

# How fast the player moves in meters per second.
export var speed = 14

var velocity = Vector3.ZERO


func _physics_process(_delta):
	var direction = Vector3.ZERO

	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_back"):
		direction.z += 1
	if Input.is_action_pressed("move_forward"):
		direction.z -= 1

	if Input.is_action_just_released("zoom_in"):
		print($Camera.size)
		$Camera.size-=5

	if Input.is_action_just_released("zoom_out"):
		print($Camera.size)
		$Camera.size+=5
	if direction != Vector3.ZERO:
		direction = direction.normalized()


	velocity.x = direction.x * speed
	velocity.z = direction.z * speed

	velocity = move_and_slide(velocity, Vector3.UP)
