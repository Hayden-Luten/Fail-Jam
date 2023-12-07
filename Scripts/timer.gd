extends Node2D
var displayTime = 0
@onready var label = $Label
var time
func _ready():
	pass # Replace with function body.


func _process(delta):
	gv.time[gv.saveNum] += delta
	displayTime = gv.round_to_dec(gv.time[gv.saveNum], 3)
	label.text = str(displayTime)
