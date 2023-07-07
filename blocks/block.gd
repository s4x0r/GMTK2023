extends StaticBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var upgrades = []
var prop_owner = "none"
var prop_value=0
var type = "empty"
var for_sale = false
var street_address

# Called when the node enters the scene tree for the first time.
func _ready():

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func start():
	pass

func sell():#it's free real estate
	for_sale= true
	$blockui/blockinfo/GridContainer/buy.disabled=false
	
	
	pass

func buy(new_owner):
	var new_block
	if type == "empty":
		new_block = load("res://blocks/field.tscn").instance()
		new_block.prop_owner=new_owner
		new_block.prop_value=prop_value
		new_block.street_address=street_address
		new_block.for_sale=false
		get_parent().add_child(new_block)
		new_block.translation = translation
		new_block.start()
		queue_free()
		
	else:
		new_block.prop_owner=new_owner
		new_block.for_sale=false
		start()



	pass

func upgrade(new_type):
	var new_block = load("res://blocks/"+new_type+".tscn").instance()
	new_block.prop_owner=prop_owner
	new_block.prop_value=prop_value
	new_block.for_sale=false
	new_block.street_address=street_address
	get_parent().add_child(new_block)
	new_block.translation = translation
	new_block.start()
	queue_free()
	pass



func _on_Area_mouse_entered():
	#translation.y+=.3
	pass # Replace with function body.


func _on_Area_mouse_exited():

	$AnimationPlayer.play("default")
	pass # Replace with function body.


func _on_Area_input_event(_camera, event, _position, _normal, _shape_idx):
	if event is InputEventMouseButton && event.button_index == 1:
		
		$blockui.open()
		#print("click")
	if event is InputEventMouseMotion:
		$AnimationPlayer.play("selected")
	pass # Replace with function body.
