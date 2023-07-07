extends "res://blocks/block.gd"




# Called when the node enters the scene tree for the first time.
func _init():
	upgrades = ["house", "road", "stand"]
	type = "field"
	$blockui/blockinfo/GridContainer/upgrade.disabled=false


func _ready():

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
