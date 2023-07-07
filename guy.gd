extends KinematicBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area_input_event(camera:Node, event:InputEvent, position:Vector3, normal:Vector3, shape_idx:int):
	if event is InputEventMouseMotion:
		#print(position)
		$pivot.look_at(Vector3(position.x, $pivot.translation.y, position.z), Vector3.UP)
	
	pass # Replace with function body.
