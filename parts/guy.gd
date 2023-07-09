extends KinematicBody

# How fast the player moves in meters per second.
export var speed = 14
var gravity = 14
var velocity = Vector3.ZERO
var hp = 20
var rolling = false

func _physics_process(delta):
	var direction = Vector3.ZERO
	$ProgressBar.value = hp
	if hp<1:
		#print([name, "died"])
		$"../killscreen".show()
		call_deferred("queue_free")

	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_back"):
		direction.z += 1
	if Input.is_action_pressed("move_forward"):
		direction.z -= 1
	if Input.is_action_just_pressed("roll"):
		if not rolling:
			rolling =true
			$body/AnimationPlayer.call_deferred("play","roll")
			#$body/body2.rotate_object_local(Vector3.LEFT, 180)
			#$body/body2.rotate_object_local(Vector3.RIGHT, 180)
		pass

	if Input.is_action_just_released("zoom_in"):
		#print($Camera.size)
		$Camera.size-=5

	if Input.is_action_just_released("zoom_out"):
		#print($Camera.size)
		$Camera.size+=5
	if direction != Vector3.ZERO:
		$body.look_at(to_global(velocity), Vector3.UP)
		direction = direction.normalized()



	if get_last_slide_collision() != null:
		if "mimic" in get_last_slide_collision().collider.get_groups() && not rolling:
			hp-=3
			#print([name, "damaged", 3])
			direction = direction*Vector3(-1, 0, -1)

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


func _on_AnimationPlayer_animation_finished(anim_name:String):
	if anim_name == "roll":
		rolling = false
		$body/AnimationPlayer.play("default")
	pass # Replace with function body.
