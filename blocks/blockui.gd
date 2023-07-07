extends Control
onready var p =get_parent()

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	update()

func update():
	$blockinfo.hide()
	#setup
	$blockinfo/key/name.text=str(p.street_address)
	$blockinfo/key/value.text=str(p.prop_value)
	$blockinfo/key/owner.text= p.prop_owner
	$blockinfo/key/type.text = p.type

	for i in p.upgrades+["cancel"]:
		$blockinfo/upmenu.add_item(i)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func open():
	#print(p.upgrades)
	get_tree().call_group("closeme", "close")
	#print(p.type)
	#print(get_tree().get_nodes_in_group("closme"))
	yield(get_tree().create_timer(0.1), "timeout")
	$blockinfo.show()


func close():
	$blockinfo.hide()
	
	pass # Replace with function body.



func _on_upmenu_item_activated(index:int):
	var up = $blockinfo/upmenu.get_item_text(index)
	if up == "cancel":
		$blockinfo/upmenu.hide()
	else:
		p.upgrade(up)
	pass # Replace with function body.

func _on_upgrade_pressed():
	$blockinfo/upmenu.show()
	pass # Replace with function body.