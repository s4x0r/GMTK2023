extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var world = preload("res://world.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	get_tree().change_scene_to(world)
	pass # Replace with function body.
