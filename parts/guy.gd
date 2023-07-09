extends KinematicBody

# How fast the player moves in meters per second.
export var speed = 14
var gravity = 14
var velocity = Vector3.ZERO


func _physics_process(delta):
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
		$body.look_at(to_global(velocity), Vector3.UP)
		direction = direction.normalized()


	velocity.x = direction.x * speed
	velocity.z = direction.z * speed
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	velocity = move_and_slide(velocity, Vector3.UP)
	

func _on_Area_input_event(camera:Node, event:InputEvent, position:Vector3, normal:Vector3, shape_idx:int):
	if event is InputEventMouseMotion:
		#print(position)
		$pivot.look_at(Vector3(position.x, $pivot.translation.y, position.z), Vector3.UP)
	
	pass # Replace with function body.
