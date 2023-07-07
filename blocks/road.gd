extends "res://blocks/block.gd"


var b = preload("res://blocks/block.tscn")
var street_names=["MLK", "Spillman", "Shade","Winter","Chestnut", "Mill", "Maple", "Oak", "Pine", "1st", "2nd", "3rd", "Emerald", "Wharf"]
var street_types=["St", "Ave", "Rd", "Ln", "Blvd"]

# Called when the node enters the scene tree for the first time.
func _init():
	type = "road"
	street_address="none"
	pass # Replace with function body.


func start():
	var fill = []
	for i in [
			Vector3(0, 2, 2),
			Vector3(2, 2, 0),
			Vector3(0, 2, -2),
			Vector3(-2, 2, 0),
		]:
		
		$checker.translation = i
		yield(get_tree().create_timer(0.12), "timeout")
		var areas=$checker.get_overlapping_areas()
		print(areas)
		
		if areas == []:
			fill+=[to_global(i-Vector3(0, 2, 0))]
			continue
		elif areas.size() ==1:
			if areas[0].get_parent().type == "road":
				print("found road")
				street_address=areas[0].get_parent().street_address
			
		pass
	$checker.translation =Vector3(0, -2, 0)
	if street_address =="none":
		street_address = street_names[randi() % street_names.size()]+" "+street_types[randi() % street_types.size()]
	print(fill)
	for i in fill:
		print()
		var new_block = load("res://blocks/block.tscn").instance()
		new_block.prop_owner="jim"
		new_block.prop_value=0#its free real estate
		new_block.street_address=str(randi()%999)+" "+str(street_address)
		new_block.sell()
		get_parent().add_child(new_block)
		new_block.translation = i
		pass
	$blockui.update()

	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
