extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var money = 0
var cur_block

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$money/HBoxContainer/val.text=str(money)
	pass

