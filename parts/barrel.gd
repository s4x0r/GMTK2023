extends KinematicBody

export var speed = 14

var velocity = Vector3.ZERO
var target= null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.


func _physics_process(_delta):
	var direction = Vector3.ZERO
	if target != null:
		look_at(Vector3(target.translation.x, translation.y, target.translation.z), Vector3.UP)
		direction = translation - target.translation
		pass


	if direction != Vector3.ZERO:
		direction = -direction.normalized()


	velocity.x = direction.x * speed
	velocity.z = direction.z * speed
	
	#$body.look_at(to_global(velocity), Vector3.UP)
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
